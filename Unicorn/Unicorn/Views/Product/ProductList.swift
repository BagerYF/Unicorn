    //
    //  ProductList.swift
    //  Unicorn
    //
    //  Created by Bager on 2023/12/30.
    //

import SwiftUI
import Kingfisher
import Refresh
import PopupView

struct ProductList: View {

    @Binding var path: NavigationPath

    @ObservedObject
    var vm: ProductListVM = ProductListVM()

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    @State var showSortOrFilter = true // true: sort , false: filter

    var body: some View {
        content
            .navigationTitle("Products")
            .navigationBarTitleDisplayMode(.inline)
            .navBackButton()
            .toolbar(.hidden, for: .tabBar)
            .modifier(SetNavCartButton(path: $path))
            .popup(isPresented: $vm.showSortOrFilterView) {
                showSortOrFilter ? AnyView(sortViews) : AnyView(filterViews)
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
        ScrollView {
            HStack {
                HStack{
                    Image("product_refine")
                    Text("Refine")
                        .modifier(TextBlack14())
                }
                .onTapGesture {
                    self.showSortOrFilter = false
                    vm.showSortOrFilterView = true
                }
                Spacer()
                HStack{
                    Image("product_down_arrow")
                    Text("Sort:")
                        .modifier(TextBlack14())
                    Text(vm.sortModel.name)
                        .modifier(TextGrey9E9E9E14())
                }
                .onTapGesture {
                    self.showSortOrFilter = true
                    vm.showSortOrFilterView = true
                }
            }
            .padding(EdgeInsets(top: 10, leading: 16, bottom: 10, trailing: 16))
            LazyVGrid(columns: columns) {
                ForEach(0..<vm.data.count, id: \.self) { index in
                        let item = vm.data[index].node
                        VStack(spacing: 0) {
                            KFImage(URL(string: item.images.edges.count > 0 ? item.images.edges[0].node.url : AppConstants.ImagePlaceHolder))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
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
                        .padding(.horizontal, 10)
                        .onTapGesture {
                            path.append(RouterModel(destination: .productDetail, params: ["id": vm.data[index].node.id]))
                        }
                }
            }
            .padding(.horizontal, 10)

            if vm.data.count > 0 {
                RefreshFooter(refreshing: $vm.isLoading, action: vm.getData) {
                    if vm.isFinished {
                        Text("No more data!")
                    } else {
                        Loading()
                    }
                }
                .noMore(vm.isFinished)
                .preload(offset: 50)
            }
        }
        .enableRefresh()
        .overlay(Group {
            if vm.data.count == 0 {
                Loading()
            } else {
                EmptyView()
            }
        })
    }

    var sortViews: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top){
                Text("Sort by")
                    .modifier(TextBlack14())
                Spacer()
                Image("filter_del")
                    .onTapGesture {
                        vm.showSortOrFilterView = false
                    }
            }
            ForEach(vm.sortList, id: \.id) { item in
                HStack(){
                    item.name == vm.sortModel.name ?
                    Image("check_y") :
                    Image("check_n_")
                    Text(item.name)
                        .modifier(TextBlack14())
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 16))
                .onTapGesture {
                    vm.sortClick(item: item)
                }
            }
        }
        .frame(height: 240)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 16)
        .padding(.vertical, 16)
        .background(.white)
    }

    var filterViews: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top){
                Text("Filter")
                    .modifier(TextBlack14())
                Spacer()
                Text("Clear")
                    .modifier(TextBlack14())
                    .onTapGesture {
                        vm.clearFilter()
                    }
                Image("filter_del")
                    .onTapGesture {
                        vm.showSortOrFilterView = false
                    }
            }
            .padding(.horizontal, 16)
            Divider()
            HStack(spacing: 0) {
                List() {
                    Section() {
                        ForEach(0..<vm.allFilters.count, id: \.self) { index in
                            let item = vm.allFilters[index]
                            VStack(alignment: .leading, spacing: 0) {
                                if (item.selected == true) {
                                    Text(item.label)
                                        .modifier(TextBlack16())
                                        .frame(height: 44)
                                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 2))
                                } else {
                                    Text(item.label)
                                        .modifier(TextGrey9E9E9E16())
                                        .frame(height: 44)
                                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 2))
                                }
                                Divider()
                            }
                            .listRowInsets(.init(top: 0, leading: 16, bottom: 0, trailing: 0))
                            .listRowSeparator(.hidden)
                            .onTapGesture {
                                vm.leftFilterClick(index: index)
                            }
                        }
                    }
                }
                .frame(width: kScreenWidth * 0.36)
                .background(.white)
                .scrollContentBackground(.hidden)
                .listStyle(.plain)
                .environment(\.defaultMinListRowHeight, 30)

                Divider()

                List() {
                    Section() {
                        ForEach(0..<vm.subFilters.count, id: \.self) { index in
                            let item = vm.subFilters[index]
                            VStack(alignment: .leading, spacing: 0) {
                                if (item.selected == true) {
                                    Text("\(item.label)(\(item.count))")
                                        .modifier(TextBlack16())
                                        .frame(height: 44)
                                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 2))
                                } else {
                                    Text("\(item.label)(\(item.count))")
                                        .modifier(TextGrey9E9E9E16())
                                        .frame(height: 44)
                                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 2))
                                }
                                Divider()
                            }
                            .listRowInsets(.init(top: 0, leading: 16, bottom: 0, trailing: 0))
                            .listRowSeparator(.hidden)
                            .onTapGesture {
                                vm.rightFilterClick(index: index)
                            }
                        }
                    }
                }
                .frame(width: kScreenWidth * 0.64)
                .background(.white)
                .scrollContentBackground(.hidden)
                .listStyle(.plain)
                .environment(\.defaultMinListRowHeight, 30)
            }
        }
        .frame(height: kScreenHeight - UIDevice.navigationFullHeight() - UIDevice.safeDistanceBottom() - 40)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 16)
        .padding(.vertical, 16)
        .background(.white)
    }
}
