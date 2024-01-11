    //
    //  Search.swift
    //  Unicorn
    //
    //  Created by Bager on 2023/12/13.
    //

import SwiftUI
import PagerTabStripView

struct Search: View {

    @State private var path = NavigationPath()

    @ObservedObject
    var vm = SearchVM()

    @State var active = false

    @State var selection = "Women"

    var body: some View {
        NavigationStack(path: $path) {
            content
                .navigationTitle("Search")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(active ? .hidden : .visible, for: .navigationBar)
                .modifier(SetNavCartButton(path: $path))
                .navigationDestination(for: RouterModel.self) { route in
                    route.destination.view($path, params: route.params)
                }
        }
    }

    var content: some View {
        VStack(alignment: .leading) {
            searchView
            active ? AnyView(searchingView) : AnyView(normalView)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }

    var searchView: some View {
        HStack(spacing: 0) {
            HStack {
                Image("search")
                TextField("Search", text: $vm.searchText, onEditingChanged: { editing in
                    withAnimation {
                        active = editing
                    }
                })
                .onSubmit {
                    vm.search()
                }
                .frame(height: 40)
                .tint(.black)
            }
            .padding(.horizontal, 7)
            .background(Color(AppColor.grey_eeeeee))
            .cornerRadius(2)
            .padding(.horizontal, 16)

            Button("Cancel") {
                withAnimation {
                    active = false
                }
                hideKeyboard()
                vm.searchText = ""
            }
            .modifier(TextBlack16())
            .padding(.trailing, active ? 16 : 0)
            .opacity(active ? 1 : 0)
            .frame(width: active ? nil : 0)
        }
        .frame(height: 40)
        .padding(.vertical, 10)
    }

    var normalView: some View {
        VStack(alignment: .leading) {
            Text("Department")
                .modifier(TextBlack14())
            .padding(EdgeInsets(top: 4, leading: 16, bottom: 14, trailing: 0))
            pagerView
        }
    }

    var searchingView: some View {
        List() {
            Section() {
                ForEach(vm.suggestList, id: \.id) { designer in
                    VStack(spacing: 0) {
                        HStack {
                            Text(designer.name)
                                .modifier(TextBlack16())
                            Spacer()
                        }
                        .frame(height: 44)
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                        Divider()
                    }
                    .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .listRowSeparator(.hidden)
                }
            } header: {
                Text("Suggested")
                    .modifier(TextBlack14())
                    .listRowSeparator(.hidden)
                    .listRowInsets(.init(top: 0, leading: 16, bottom: 0, trailing: 0))
            }
        }
        .background(.white)
        .scrollContentBackground(.hidden)
        .listStyle(.plain)
        .environment(\.defaultMinListRowHeight, 30)
    }

    var pagerView: some View {
        PagerTabStripView(selection: $selection) {
            CategoryListView(path: $path, categoryList: vm.categoryList[0].children)
                .pagerTabItem(tag: "Women") {
                    TitleNavBarItem(title: vm.categoryList[0].name, selection: selection)
                }
            CategoryListView(path: $path, categoryList: vm.categoryList[1].children)
                .pagerTabItem(tag: "Men") {
                    TitleNavBarItem(title: vm.categoryList[1].name, selection: selection)
                }
            CategoryListView(path: $path, categoryList: vm.categoryList[2].children)
                .pagerTabItem(tag: "Kids") {
                    TitleNavBarItem(title: vm.categoryList[2].name, selection: selection)
                }
        }
        .pagerTabStripViewStyle(.scrollableBarButton(tabItemSpacing: 10,
                                                     tabItemHeight: 32,
                                                     padding: EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16),
                                                     indicatorViewHeight: 0
                                                    ))
    }
}

struct TitleNavBarItem: View {
    let title: String
    let selection: String

    var body: some View {
        VStack {
            Text(title)
                .foregroundColor(selection == title ? Color.white : Color.gray)
                .modifier(TextBlack14())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background {
            selection == title ? Rectangle().fill(.black).frame(height: 32).cornerRadius(16) : nil
        }
    }
}

struct CategoryListView: View {

    @Binding var path: NavigationPath

    let categoryList: [CategoryModel]

    var body: some View {
        List() {
            ForEach(categoryList, id: \.id) { category in
                VStack(spacing: 0) {
                    HStack {
                        category.name == "Sale" ?
                        AnyView(Text(category.name)
                            .modifier(TextRed16())) :
                        AnyView(Text(category.name)
                            .modifier(TextBlack16()))
                        Spacer()
                        Image("arrow")
                    }
                    .frame(height: 44)
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                    .contentShape(Rectangle())
                    .onTapGesture {
                        path.append(RouterModel(destination: .subCategoryList, params: ["categoryList": category.children, "subCategoryTitle": category.name]))
                    }
                    Divider()
                }
                .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                .listRowSeparator(.hidden)
            }
        }
        .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
        .background(.white)
        .scrollContentBackground(.hidden)
        .listStyle(.plain)
        .environment(\.defaultMinListRowHeight, 30)
    }
}

#Preview {
    Search()
}
