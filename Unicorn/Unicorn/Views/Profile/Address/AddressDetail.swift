    //
    //  AddressDetail.swift
    //  Unicorn
    //
    //  Created by Bager on 2024/1/5.
    //

import SwiftUI
import AppSchema

struct AddressDetail: View {

    @ObservedObject
    var vm : AddressVM

    @ObservedObject
    var countryListVM = CountryListVM()

    @Environment(\.dismiss) private var dismiss

    var data: AppSchema.CustomerQuery.Data.Customer.Addresses.Edge?

    init(data: AppSchema.CustomerQuery.Data.Customer.Addresses.Edge? = nil) {
        self.vm = AddressVM(data: data)
        self.vm.countryListVM = countryListVM
        self.data = data
    }

    var body: some View {
        content
            .navigationTitle(vm.isNewOrEditAddress ? "Add address" : "Update Address")
            .navigationBarTitleDisplayMode(.inline)
            .navBackButton()
            .fullScreenCover(isPresented: $vm.showCountryList) {
                LazyView(CountryList(vm: countryListVM, callBack: { callBack in
                    vm.selectCountry(country: callBack as! CountryModel)
                }))
            }
    }

    var content: some View {
        VStack {
            ScrollView {
                Text("*Required Fields")
                    .modifier(TextBlack12())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 16)
                ForEach(0..<vm.addressInputList.count, id: \.self) { index in
                    let items = vm.addressInputList[index]
                    HStack(spacing: 10) {
                        ForEach(0..<items.count, id: \.self) { i in
                            let item = items[i]
                            if item.show {
                                InputView(item: item)
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)

            HStack {
                Button {
                    vm.btnClick {
                        dismiss()
                    }
                } label: {
                    Text(vm.isNewOrEditAddress ? "Add address" : "Update Address")
                        .font(.system(size: 16))
                        .frame(height: 40)
                        .frame(maxWidth: .infinity)
                        .background(.black)
                        .foregroundColor(.white)
                        .cornerRadius(2)
                }
                .buttonStyle(.plain)
                .padding(.horizontal, 16)
            }
        }
    }
}

