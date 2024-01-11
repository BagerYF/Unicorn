    //
    //  AddressDetailVM.swift
    //  Unicorn
    //
    //  Created by Bager on 2024/1/5.
    //

import SwiftUI
import AppSchema
import Kingfisher
import Defaults

final class AddressVM: ObservableObject {

    @Published var addressInputList: [[InputModel]] = []

    var data: AppSchema.CustomerQuery.Data.Customer.Addresses.Edge?

    @Published var countryList: [CountryModel] = []

    @Published var selectCountryModel: CountryModel?

    @Published var selectStateModel: CountryModel?

    @Published var showCountryList = false

    @Published var isCountryOrState = true // true: country, false: state

    @Published var isNewOrEditAddress = true // true: new, false: edit

    @Published var countryListVM : CountryListVM?

    @Environment(\.dismiss) private var dismiss

    init(data: AppSchema.CustomerQuery.Data.Customer.Addresses.Edge? = nil) {
        self.data = data

        if countryList.count == 0 {
            do {
                if let path = Bundle.main.path(forResource: "CountryData", ofType: "json") {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                    let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                    if let jsonResult = jsonResult as? [Dictionary<String, AnyObject>] {
                        for item in jsonResult {
                            countryList.append(CountryModel.init(fromDictionary: item))
                        }
                    }
                }
            } catch {
                print("error")
            }
        }

        initData()
    }

    func initData() {

        if data == nil {
            isNewOrEditAddress = true
            for item in countryList {
                if item.code == "CN" {
                    selectCountryModel = item
                    break
                }
            }
        } else {
            isNewOrEditAddress = false
            for item in countryList {
                if item.code == data?.node.countryCodeV2?.rawValue {
                    selectCountryModel = item
                    break
                }
            }

            for item in selectCountryModel?.provinces ?? [] {
                if item.code == data?.node.provinceCode {
                    selectStateModel = item
                    break
                }
            }
        }

        addressInputList = [
            [InputModel(title: "First Name", text: data?.node.firstName ?? "")],
            [InputModel(title: "Last Name", text: data?.node.lastName ?? "")],
            [InputModel(title: "Country", text: selectCountryModel?.name ?? "", callBack: {
                self.countryClick()
            }, leftImg: "https://d1mp1ehq6zpjr9.cloudfront.net/static/images/flags/\(selectCountryModel?.code ?? "").png", rightImg: "arrow_down")],
            [InputModel(title: "Address", text: data?.node.address1 ?? "")],
            [InputModel(title: "Apartment,Suite,Unit,Building", text: data?.node.address2 ?? "", optional: true, requireds: false)],
            [InputModel(title: "City", text: data?.node.city ?? "")],
            [InputModel(title: "State", text: selectStateModel?.name ?? "", callBack: {
                self.stateClick()
            }, rightImg: "arrow_down", show: selectCountryModel?.provinces.count ?? 0 > 0), InputModel(title: "Postcode / Zipcode", text:  data?.node.zip ?? "")],
            [InputModel(title: "Phone", text: data?.node.phone ?? "", optional: true, requireds: false)],
        ]
    }

    func countryClick() {
        showCountryList = true
        isCountryOrState = true
        countryListVM?.isCountryOrState = isCountryOrState
        countryListVM?.allList = countryList
        countryListVM?.searchData()
    }

    func stateClick() {
        showCountryList = true
        isCountryOrState = false
        countryListVM?.isCountryOrState = isCountryOrState
        countryListVM?.allList = selectCountryModel?.provinces ?? []
        countryListVM?.searchData()
    }

    func selectCountry(country: CountryModel) {
        showCountryList = false
        if isCountryOrState {
            selectCountryModel = country
            selectStateModel = nil
            addressInputList[2][0] = InputModel(title: "Country", text: selectCountryModel?.name ?? "", callBack: {
                self.countryClick()
            }, leftImg: "https://d1mp1ehq6zpjr9.cloudfront.net/static/images/flags/\(selectCountryModel?.code ?? "").png", rightImg: "arrow_down")
        } else {
            selectStateModel = country
        }
        addressInputList[6][0] = InputModel(title: "State", text: selectStateModel?.name ?? "", callBack: {
            self.stateClick()
        }, rightImg: "arrow_down", show: selectCountryModel?.provinces.count ?? 0 > 0)
    }


    func btnClick(callback: @escaping CallBacks) {
        let textFields: [[InputModel]] = addressInputList
//        if selectCountryModel?.provinces.count ?? 0 == 0 {
//            textFields[6].remove(at: 0)
//        }
        var hasError = false
        for items in textFields {
            for item in items {
                if item.requireds && item.text.count == 0 && item.show {
                    item.showError = true
                    hasError = true
                }
            }
        }
        if hasError == false {
            if data == nil {
                showLoading()
                Network.shared.apollo.perform(mutation: AppSchema.CustomerAddressCreateMutation(address: AppSchema.MailingAddressInput(address1: .some(addressInputList[3][0].text), address2: .some(addressInputList[4][0].text), city: .some(addressInputList[5][0].text), country: .some(addressInputList[2][0].text), firstName: .some(addressInputList[0][0].text), lastName: .some(addressInputList[1][0].text), phone: .some(addressInputList[7][0].text), province: .some(addressInputList[6][0].text), zip: .some(addressInputList[6][1].text)), customerAccessToken: Defaults[.token])) { result in
                    hideLoading()
                    switch result {
                    case .success(_):
                        callback()
                    case .failure(let error):
                        print("error===\(error)")
                    }
                }
            } else {
                showLoading()
                Network.shared.apollo.perform(mutation: AppSchema.CustomerAddressUpdateMutation(address: AppSchema.MailingAddressInput(address1: .some(addressInputList[3][0].text), address2: .some(addressInputList[4][0].text), city: .some(addressInputList[5][0].text), country: .some(addressInputList[2][0].text), firstName: .some(addressInputList[0][0].text), lastName: .some(addressInputList[1][0].text), phone: .some(addressInputList[7][0].text), province: .some(addressInputList[6][0].text), zip: .some(addressInputList[6][1].text)),  customerAccessToken:Defaults[.token], id: data?.node.id ?? "")) { result in
                    hideLoading()
                    switch result {
                    case .success(_):
                        callback()
                    case .failure(let error):
                        print("error===\(error)")
                    }
                }
            }
        }
    }

}
