    //
    //  DesignersAll.swift
    //  Unicorn
    //
    //  Created by Bager on 2023/12/22.
    //

import SwiftUI

struct DesignersList: View {

    @Binding var path: NavigationPath

    @ObservedObject
    var vm = DesignerListVM()

    @State var active = false

    var body: some View {
        content
            .navigationTitle("Designer A-Z")
            .navigationBarTitleDisplayMode(.inline)
            .navBackButton()
            .toolbar(.hidden, for: .tabBar)
    }

    var content: some View {

        ScrollView {
            searchView
            List {
                ForEach(vm.group, id: \.name) { group in
                    Section() {
                        ForEach(vm.showData[group.name]!, id: \.id) { designer in
                            VStack(spacing: 0) {
                                HStack {
                                    Text(designer.name)
                                        .modifier(TextBlack16())
                                    Spacer()
                                    Image("arrow")
                                }
                                .frame(height: 44)
                                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                                .onTapGesture {
                                    path.append(RouterModel(destination: .productList))
                                }
                                Divider()
                            }
                            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 16))
                            .listRowSeparator(.hidden)
                        }
                    } header: {
                        Text(group.name)
                            .modifier(TextBlackBold16())
                            .listRowSeparator(.hidden)
                    }
                }
            }
            .frame(height: kScreenHeight - UIDevice.navigationFullHeight() - 60)
            .padding(0)
            .background(.white)
            .scrollContentBackground(.hidden)
            .listStyle(.plain)
            .environment(\.defaultMinListRowHeight, 30)
            .modifier(VerticalIndex(indexableList: vm.groupStr))
        }
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
                .onChange(of: vm.searchText, perform: { value in
                    vm.searchData()
                })
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
            }
            .modifier(TextBlack16())
            .padding(.trailing, active ? 16 : 0)
            .opacity(active ? 1 : 0)
            .frame(width: active ? nil : 0)
        }
        .frame(height: 40)
        .padding(.vertical, 10)
    }
}

struct VerticalIndex: ViewModifier {
    let indexableList: [String]
    func body(content: Content) -> some View {
        var body: some View {
            ScrollViewReader { scrollProxy in
                ZStack {
                    content
                    VStack {
                        ForEach(indexableList, id: \.self) { letter in
                            HStack {
                                Spacer()
                                Button(action: {
                                    withAnimation {
                                        scrollProxy.scrollTo(letter)
                                    }
                                }, label: {
                                    Text(letter)
                                        .modifier(TextBlack12())
                                        .padding(.top, 1)
                                        .padding(.trailing, 7)
                                })
                            }
                        }
                    }
                }
            }
        }
        return body
    }
}
