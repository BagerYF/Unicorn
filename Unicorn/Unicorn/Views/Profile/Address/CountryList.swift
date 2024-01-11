    //
    //  CountryList.swift
    //  Unicorn
    //
    //  Created by Bager on 2024/1/6.
    //

import SwiftUI
import Kingfisher

struct CountryList: View {

    @ObservedObject
    var vm : CountryListVM

//    @ObservedObject
//    var addressVM : AddressVM

    var callBack: CallBack

    @State var active = false

    var body: some View {
        NavigationStack {
            content
                .navigationTitle("Country")
                .navigationBarTitleDisplayMode(.inline)
                .modifier(SetNavBackButton(imageStr: "nav_close"))
        }
    }

    var content: some View {
        ScrollView {
            searchView
            List {
                ForEach(vm.group, id: \.id) { group in
                    Section() {
                        ForEach(vm.showData[group.name]!, id: \.id) { country in
                            VStack(spacing: 0) {
                                HStack {
                                    if vm.isCountryOrState {
                                        KFImage(URL(string: "https://d1mp1ehq6zpjr9.cloudfront.net/static/images/flags/\(country.code ?? "").png"))
                                            .resizable()
                                            .frame(width: 24, height: 24)
                                            .cornerRadius(12)
                                    }
                                    Text(country.name)
                                        .modifier(TextBlack16())
                                    Spacer()
//                                    if country.code ?? "" == vm.selectCountryModel.code ?? "" || country.code ?? "" == vm.selectStateModel.code ?? "" {
//                                        Image("selected")
//                                    }
                                }
                                .frame(height: 50)
                                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                                Divider()
                            }
                            .contentShape(Rectangle())
                            .onTapGesture(perform: {
//                                addressVM.selectCountry(country: country)
                                callBack(country)
                            })
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

    //#Preview {
    //    CountryList()
    //}
