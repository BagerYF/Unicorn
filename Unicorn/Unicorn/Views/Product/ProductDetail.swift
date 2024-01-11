//
//  ProductDetail.swift
//  Unicorn
//
//  Created by Bager on 2023/12/30.
//

import SwiftUI
import SwiftUIPager
import Kingfisher
import AppSchema
import PopupView

struct ProductDetail: View {

    @Binding var path: NavigationPath

    @EnvironmentObject var cartVM: CartVM

    var id: String

    @ObservedObject
    var vm: ProductDetailVM = ProductDetailVM()

    var body: some View {
        content
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .navBackButton()
            .modifier(SetNavCartButton(path: $path))
            .toolbar(.hidden, for: .tabBar)
            .popup(isPresented: $vm.showSize) {
                VStack {
                    HStack(alignment: .top){
                        Text("Please select your size")
                            .modifier(TextBlack14())
                        Spacer()
                        Image("filter_del")
                            .onTapGesture {
                                vm.showSize = false
                            }
                    }
                    .padding(.vertical, 10)
                    ZStack {
                        Picker(selection: $vm.variantIndex, label: Text("Color")) {
                            ForEach(0..<vm.variants.count, id: \.self) { index in
                                HStack {
                                    Text(vm.variants[index].node.title)
                                        .modifier(TextBlack14())
                                    Spacer()
                                    if vm.variants[index].node.quantityAvailable ?? 0 <= 0 {
                                        Text("Out of stock")
                                            .modifier(TextGrey9E9E9E14())
                                    } else if vm.variants[index].node.quantityAvailable! < 5 {
                                        Text("Low stock")
                                            .modifier(TextGrey9E9E9E14())
                                    }
                                }
                                .padding(.horizontal, 16)
                                .tag(index)
                            }
                        }
                        .onChange(of: vm.variantIndex, initial: true, { o, n in
                            vm.sizeChange()
                        })
                        .pickerStyle(.wheel)
                    }
                    Button(action: {
                        vm.sizeClick()
                    }, label: {
                        if vm.variantEnable == true {
                            Text("Select")
                                .frame(width: kScreenWidth - 32, height: 44)
                                .background(.black)
                                .foregroundColor(.white)
                                .cornerRadius(4)
                        } else {
                            Text("Out of stock")
                                .frame(width: kScreenWidth - 32, height: 44)
                                .background(Color(AppColor.grey_bdbdbd))
                                .foregroundColor(.white)
                                .cornerRadius(4)
                        }
                    })
                    .buttonStyle(PlainButtonStyle())
                }
                .background(.white)
                .safeAreaPadding()

            } customize: { $0
                .type(.toast)
                .position(.bottom)
                .animation(.spring())
                .closeOnTapOutside(true)
                .closeOnTap(false)
                .backgroundColor(.black.opacity(0.3))
                .dragToDismiss(false)
            }
            .popup(isPresented: $cartVM.showToast) {
                HStack {
                    Text("Already added to bag!")
                        .modifier(TextWhite14())
                        .padding(.horizontal, 10)
                    Spacer()
                }
                .frame(width: kScreenWidth - 32, height: 40)
                .background(.black)
                .cornerRadius(4)
            } customize: { $0
                .type(.floater(verticalPadding: 10, horizontalPadding: 16, useSafeAreaInset: true))
                .position(.top)
                .animation(.spring())
                .closeOnTapOutside(true)
                .closeOnTap(false)
                .backgroundColor(.black.opacity(0.0))
                .autohideIn(2)
            }
            .onAppear() {
                vm.getData(id: self.id)
            }
    }

    var content: some View {
        VStack {
            ScrollView {
                if (vm.product != nil) {
                    PagerView(path: $path, data: vm.images)
                    BasicInfoView(data: vm.product!)
                    SizeView(data: vm.product!, vm: vm)
                    DescriptionView(data: vm.product!)
                    RecommendedView(path: $path, data: vm.recommendedData)
                }
            }
            Button(action: {
                cartVM.addProductsToCart(variantId: vm.variant?.node.id ?? "")
            }, label: {
                Text("Add to bag")
                    .padding(.horizontal, kScreenWidth / 2.0 - 16 - 40)
                    .padding(.vertical, 14)
                    .background(.black)
                    .foregroundColor(.white)
                    .cornerRadius(4)
            })
            .buttonStyle(PlainButtonStyle())
        }
    }
}

struct PagerView: View {

    @Binding var path: NavigationPath

    var data: [AppSchema.GetProductByIdQuery.Data.Product.Images.Edge]

    @StateObject var page: Page = .first()

    var body: some View {
        Pager(page: page,
              data: Array(0..<data.count),
              id: \.self,
              content: { index in
            let item = data[index]
                VStack(alignment: .leading, spacing: 0) {
                    KFImage(URL(string: item.node.url))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 380)
                        .background(.white)
                }
                .frame(height: 380)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .onTapGesture {
                    path.append(RouterModel(destination: .productList))
                }
        })
        .singlePagination(ratio: 0.1)
        .frame(height: 380)
    }
}

struct BasicInfoView: View {

    var data: AppSchema.GetProductByIdQuery.Data.Product

    @EnvironmentObject var wishlistVM: WishlistVM

    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            Text(data.vendor)
                .modifier(TextBlack24())
            Text(data.title)
                .modifier(TextBlack16())
                .lineLimit(2)
            HStack {
                Text("$ \(data.variants.edges.first?.node.compareAtPrice?.amount ?? "")")
                    .modifier(TextBlack14())
                Text("$ \(data.variants.edges.first?.node.price.amount ?? "")")
                    .modifier(TextRed14())
                Spacer()
                HStack {
                    wishlistVM.isAddedWishlist(product: data) ? Text("Added to Wishlist")
                        .modifier(TextBlack14()) : Text("Add to Wishlist")
                        .modifier(TextBlack14())
                    wishlistVM.isAddedWishlist(product: data) ? Image("porduct_detail_star_select") : Image("porduct_detail_star")
                }
                .onTapGesture {
                    if wishlistVM.isAddedWishlist(product: data) {
                        wishlistVM.removeWishlist(id: data.id)
                    } else {
                        wishlistVM.addWishlist(product: data)
                    }
                }
            }
            .padding(.vertical, 10)
        }
        .padding(.horizontal, 16)
    }
}

struct SizeView: View {

    var data: AppSchema.GetProductByIdQuery.Data.Product

    @ObservedObject
    var vm: ProductDetailVM

    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            HStack() {
                Image("porduct_detail_size")
                Text("Size guide")
                    .modifier(TextBlack14())
                Spacer()
            }
            .padding(.vertical, 10)
            HStack() {
                Text("Size")
                    .modifier(TextBlack16())
                Text(vm.variant?.node.title ?? "")
                    .modifier(TextGrey9E9E9E14())
                Spacer()
                Image("porduct_detail_arrow")
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 10)
            .border(.black)
            .contentShape(Rectangle())
            .onTapGesture {
                vm.showSize = true
            }
        }
        .padding(.horizontal, 16)
    }
}

struct DescriptionView: View {

    var data: AppSchema.GetProductByIdQuery.Data.Product

    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            Text("Description")
                .modifier(TextBlack14())
            Text(data.description)
                .modifier(TextBlack14())
            Divider()
                .padding(.vertical, 16)
            Text("""
            Shipping and Returns

            Delivery Destinations

            Shopify ships globally to a large number of countries. For more information on delivery, visit our orders & shipping page.

            Returns

            You can purchase in confidence and send the items back to us if they are not right for you. If you would like to initiate a return, please go to your account at the top right corner where it says your name. Click \"Create Return\" next to the order your would like to return and follow the prompts.
            """)
                .modifier(TextBlack14())
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 16)
        .padding(.vertical, 16)
    }
}

struct RecommendedView: View {

    @Binding var path: NavigationPath

    var data: [AppSchema.ProductRecommendationsQuery.Data.ProductRecommendation]

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    let rows = [
            GridItem(.flexible())
        ]

    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            Text("Recommended")
                .modifier(TextBlack14())
                .padding(.horizontal, 16)
                .padding(.vertical, 16)
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows) {
                    ForEach(0..<data.count, id: \.self) { index in
                            let item = data[index]
                            VStack(spacing: 10) {
                                KFImage(URL(string: item.images.edges.count > 0 ? item.images.edges[0].node.url : AppConstants.ImagePlaceHolder))
                                    .resizable()
                                    .frame(height: 200)
                                    .background(.white)
                                Text(item.title)
                                    .lineLimit(1)
                                    .modifier(TextBlackBold16())
                                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
                                Text(item.vendor)
                                    .lineLimit(2)
                                    .multilineTextAlignment(.center)
                                    .modifier(TextBlack14())
                                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                                Text("$ \(item.variants.edges[0].node.price.amount)")
                                    .modifier(TextBlack14())
                                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 10, trailing: 0))
                            }
                            .frame(width: (kScreenWidth - 16) / 2.0)
                            .onTapGesture {
                                path.append(RouterModel(destination: .productDetail, params: ["id": data[index].id]))
                            }
                    }
                }
            }
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.paging)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 16)
    }
}


//#Preview {
//    ProductDetail(id: "gid://shopify/Product/7713246904542")
//}
