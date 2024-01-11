    //
    //  Cart.swift
    //  Unicorn
    //
    //  Created by Bager on 2024/1/3.
    //

import SwiftUI
import Kingfisher
import AppSchema
import PopupView

struct Cart: View {

    @Binding var path: NavigationPath

    @EnvironmentObject var cartVM: CartVM

    var body: some View {
        content
            .navigationTitle("Shopping Bag")
            .navigationBarTitleDisplayMode(.inline)
//            .modifier(SetNavBackButton(imageStr: "nav_close"))
            .navBackButton()
            .toolbar(.hidden, for: .tabBar)
            .popup(isPresented: $cartVM.showQty) {
                VStack {
                    HStack(alignment: .top){
                        Text("Please select your qty")
                            .modifier(TextBlack14())
                        Spacer()
                        Image("filter_del")
                            .onTapGesture {
                                cartVM.showQty = false
                            }
                    }
                    .padding(.vertical, 10)
                    ZStack {
                        Picker(selection: $cartVM.qtyIndex, label: Text("Qty")) {
                            ForEach(0..<cartVM.qtyList.count, id: \.self) { index in
                                HStack {
                                    Text(cartVM.qtyList[index])
                                        .modifier(TextBlack14())
                                }
                                .padding(.horizontal, 16)
                                .tag(index)
                            }
                        }
                        .pickerStyle(.wheel)
                    }
                    Button(action: {
                        cartVM.updateProductQuantityInCart(quantity: cartVM.qtyIndex + 1)
                    }, label: {
                        Text("Select")
                            .frame(width: kScreenWidth - 32, height: 44)
                            .background(.black)
                            .foregroundColor(.white)
                            .cornerRadius(4)
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
    }

    var content: some View {
        if cartVM.cart?.lines.edges.count ?? 0 > 0 {
            AnyView(normalView)
        } else {
            AnyView(emptyView)
        }
    }

    var emptyView: some View {
        Text("Your shopping bag is currently empty")
            .modifier(TextBlack16())
    }

    var normalView: some View {
        VStack(alignment: .leading, spacing: 0) {
            ScrollView {
                ForEach(0..<(cartVM.cart?.lines.edges.count ?? 0), id: \.self) { index in
                    CartItem(item: cartVM.cart?.lines.edges[index], cartVM: cartVM)
                }
                reviewsAndReturns
            }
            VStack(alignment: .leading, spacing: 0) {
                Divider()
                Text("Subtotal \((cartVM.cart?.cost.totalAmount.currencyCode ?? .case(.usd)).rawValue) \(cartVM.cart?.cost.totalAmount.amount ?? "")")
                    .modifier(TextBlack14())
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
                Text("Shipping and taxes calculated at checkout")
                    .modifier(TextBlack12())
                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))

                HStack {
                    Button {
                        path.append(RouterModel(destination: .checkout))
                    } label: {
                        Image("product_detail_apple_pay")
                            .frame(height: 40)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .foregroundColor(.black)
                            .border(.black)
                            .cornerRadius(2)
                    }
                    .buttonStyle(.plain)

                    Button {
                        path.append(RouterModel(destination: .checkout))
                    } label: {
                        Text("Checkout")
                            .font(.system(size: 16))
                            .frame(height: 40)
                            .frame(maxWidth: .infinity)
                            .background(.black)
                            .foregroundColor(.white)
                            .cornerRadius(2)
                    }
                    .buttonStyle(.plain)
                }
                .padding(EdgeInsets(top: 16, leading: 0, bottom: 10, trailing: 0))
            }
            .padding(.horizontal, 16)
        }
    }

    var reviewsAndReturns: some View {
        HStack(spacing: 0) {
            VStack(spacing: 0) {
                Image("cart_icon_review")
                    .padding(.vertical, 20)
                Text("Reviews")
                    .modifier(TextBlack14())
                Text("See what our customers \n have to say about \n shopping with us")
                    .modifier(TextBlack12())
                    .multilineTextAlignment(.center)
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
                Text("See Our Reviews")
                    .modifier(TextGrey75757512())
                    .underline()
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
            }
            .frame(maxWidth: .infinity)
            VStack(spacing: 0) {
                Image("cart_icon_free_return")
                    .padding(.vertical, 20)
                Text("Easy returns")
                    .modifier(TextBlack14())
                Text("Shop in confidence with \n a quick and easy return \n process")
                    .modifier(TextBlack12())
                    .multilineTextAlignment(.center)
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
                Text("Return Policy")
                    .modifier(TextGrey75757512())
                    .underline()
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
            }
            .frame(maxWidth: .infinity)

        }
    }
}

struct CartItem: View {

    var item: AppSchema.CartCommon.Lines.Edge?
    var cartVM: CartVM?

    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .top, spacing: 16) {
                KFImage(URL(string: item?.node.merchandise.asProductVariant?.image?.url ?? AppConstants.ImagePlaceHolder))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 104, height: 156)
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text(item?.node.merchandise.asProductVariant?.product.productType ?? "")
                            .modifier(TextBlack14())
                        Spacer()
                        Image("cart_delete_product")
                            .onTapGesture {
                                cartVM?.removeProductFromCart(variantId: item?.node.id ?? "")
                            }
                    }
                    Text(item?.node.merchandise.asProductVariant?.product.title ?? "")
                        .modifier(TextBlack14())
                    Text(item?.node.merchandise.asProductVariant?.title ?? "")
                        .modifier(TextGrey75757514())
                    HStack {
                        Text("Qty")
                            .modifier(TextGrey75757514())
                        Text("\(item?.node.quantity ?? 0)")
                            .modifier(TextGrey75757514())
                        Spacer()
                        Image("porduct_detail_arrow")
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        cartVM?.qtyPick(item: item)
                    }
                    .padding(.horizontal, 10)
                    .frame(width: 120, height: 32)
                    .cornerRadius(4)
                    .background(Color(AppColor.grey_eeeeee))
                }
            }
            HStack{
                Text("Move to wishlist")
                    .modifier(TextGrey75757512())
                    .frame(width: 104)
                Text("Price")
                    .modifier(TextGrey75757514())
                Spacer()
                Text("\((item?.node.cost.totalAmount.currencyCode ?? .case(.usd)).rawValue) \(item?.node.cost.totalAmount.amount ?? "")")
                    .modifier(TextBlack14())
            }
            .padding(.vertical, 16)
            Divider()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 16)
    }
}
