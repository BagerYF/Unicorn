//
//  CheckoutVM.swift
//  Unicorn
//
//  Created by Bager on 2024/1/8.
//

import SwiftUI
import Foundation
import Combine
import AppSchema

final class CheckoutVM: ObservableObject {

    @Published var page: CheckoutPage = .Address

    @Published var maxPage: CheckoutPage = .Address

    @Published var addressInputList: [[InputModel]] = []

    @Published var countryList: [CountryModel] = []

    @Published var selectCountryModel: CountryModel?

    @Published var selectStateModel: CountryModel?

    @Published var showCountryList = false

    @Published var isCountryOrState = true // true: country, false: state

    @Published var countryListVM : CountryListVM?

    @Published var cartVM : CartVM?

    @Environment(\.dismiss) private var dismiss

    @Published var checkout: AppSchema.CheckoutCommon?

    @Published var shippingRates: [AppSchema.CheckoutShippingLinesQuery.Data.Node.AsCheckout.AvailableShippingRates.ShippingRate] = []

    @Published var shippingLine: AppSchema.CheckoutShippingLineUpdateMutation.Data.CheckoutShippingLineUpdate.Checkout.ShippingLine?

    @Published var discountCode: String = ""

    @Published var discountModel = InputModel(title: "Gift card or discount code", hideTitle: true)

    @Published var showToast = false

    @Published var successCallBack: CallBacks?

    @Published var showLoadingView = false

    func initData(countryListVM: CountryListVM, cartVM: CartVM) {

        self.countryListVM = countryListVM

        self.cartVM = cartVM

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

        for item in countryList {
            if item.code == "CN" {
                selectCountryModel = item
                selectStateModel = selectCountryModel?.provinces.first
                break
            }
        }

        addressInputList = [
            [InputModel(title: "First Name", text: "first name")],
            [InputModel(title: "Last Name", text: "last name")],
            [InputModel(title: "Email", text: "bager@gamil.com")],
            [InputModel(title: "Country", text: selectCountryModel?.name ?? "", callBack: {
                self.countryClick()
            }, leftImg: "https://d1mp1ehq6zpjr9.cloudfront.net/static/images/flags/\(selectCountryModel?.code ?? "").png", rightImg: "arrow_down")],
            [InputModel(title: "Address", text: "address1")],
            [InputModel(title: "Apartment,Suite,Unit,Building", text: "address2", optional: true, requireds: false)],
            [InputModel(title: "City", text: "city")],
            [InputModel(title: "State", text: selectStateModel?.name ?? "",  callBack: {
                self.stateClick()
            }, rightImg: "arrow_down", show: selectCountryModel?.provinces.count ?? 0 > 0), InputModel(title: "Postcode / Zipcode", text: "888888")],
            [InputModel(title: "Phone", text: "99999999", optional: true, requireds: false)],
        ]

        getData()
    }

    func getData() {

        var lineItems : [AppSchema.CheckoutLineItemInput] = []
        for item in self.cartVM?.cart?.lines.edges ?? [] {
            lineItems.append(AppSchema.CheckoutLineItemInput.init(quantity: item.node.quantity, variantId: item.node.merchandise.asProductVariant?.id ?? ""))
        }

        showLoadingView = true
        Network.shared.apollo.perform(mutation: AppSchema.CheckoutCreateMutation(input: AppSchema.CheckoutCreateInput(lineItems: .some(lineItems)))) { [weak self] result in
            self?.showLoadingView = false
            switch result {
            case .success(let response):
                self?.checkout = response.data?.checkoutCreate?.checkout?.fragments.checkoutCommon
            case .failure(let error):
                print("error===\(error)")
            }
        }

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
            addressInputList[3][0] = InputModel(title: "Country", text: selectCountryModel?.name ?? "", callBack: {
                self.countryClick()
            }, leftImg: "https://d1mp1ehq6zpjr9.cloudfront.net/static/images/flags/\(selectCountryModel?.code ?? "").png", rightImg: "arrow_down")
        } else {
            selectStateModel = country
        }
        addressInputList[7][0] = InputModel(title: "State", text: selectStateModel?.name ?? "", callBack: {
            self.stateClick()
        }, rightImg: "arrow_down", show: selectCountryModel?.provinces.count ?? 0 > 0)
    }

    func nextClick() {
        if page == .Address {
            let textFields: [[InputModel]] = addressInputList
            var hasError = false
            for items in textFields {
                for item in items {
                    if item.requireds && item.text.count == 0 && item.show {
                        item.showError = true
                        hasError = true
                    }
                }
            }

            if !hasError {
                let addressInput = AppSchema.MailingAddressInput(address1: .some(addressInputList[4][0].text), address2: .some(addressInputList[5][0].text), city: .some(addressInputList[6][0].text), country: .some(addressInputList[3][0].text), firstName: .some(addressInputList[0][0].text), lastName: .some(addressInputList[1][0].text), phone: .some(addressInputList[8][0].text), province: .some(addressInputList[7][0].text), zip: .some(addressInputList[7][1].text))
                addressNextClick(address: addressInput)
            }
        } else if page == .Delivery {
            if shippingLine == nil {
                showToast = true
            } else {
                page = .Payment
                maxPage = .Payment
            }
        } else if page == .Payment {
            checkoutCompleteFree()
        }
    }

    func addressNextClick(address: AppSchema.MailingAddressInput) {
        showLoadingView = true
        Network.shared.apollo.perform(mutation: AppSchema.CheckoutShippingAddressUpdateV2Mutation(checkoutId: checkout?.id ?? "", shippingAddress: address)) { [weak self] result in
            switch result {
            case .success(let response):
                self?.checkout = response.data?.checkoutShippingAddressUpdateV2?.checkout?.fragments.checkoutCommon
                self?.updateShippingRates()
            case .failure(let error):
                print("error===\(error)")
                hideLoading()
            }
        }
    }

    func updateShippingRates() {
        Network.shared.apollo.fetch(query: AppSchema.CheckoutShippingLinesQuery(id: self.checkout?.id ?? ""), cachePolicy: .fetchIgnoringCacheData) { [weak self] result in
            switch result {
            case .success(let response):
                let tempCheckout = response.data?.node?.asCheckout
                if tempCheckout?.availableShippingRates?.ready == true {
                    self?.shippingRates = tempCheckout?.availableShippingRates?.shippingRates ?? []
                    self?.page = .Delivery
                    self?.maxPage = .Delivery
                    self?.showLoadingView = false
                } else {
                    self?.updateShippingRates()
                }
            case .failure(let error):
                print("error===\(error)")
                self?.showLoadingView = false
            }
        }
    }

    func updateShippingLine(index: Int) {
        let tempShippingLine = shippingRates[index]
        if tempShippingLine.title == shippingLine?.title {
            return
        }
        showLoadingView = true
        Network.shared.apollo.perform(mutation: AppSchema.CheckoutShippingLineUpdateMutation(checkoutId: checkout?.id ?? "", shippingRateHandle: tempShippingLine.handle)) { [weak self] result in
            self?.showLoadingView = false
            switch result {
            case .success(let response):
                self?.checkout = response.data?.checkoutShippingLineUpdate?.checkout?.fragments.checkoutCommon
                self?.shippingLine = response.data?.checkoutShippingLineUpdate?.checkout?.shippingLine
            case .failure(let error):
                print("error===\(error)")
            }
        }
    }

    func appleyDiscountCode() {
        var code = discountModel.text
        if code.count > 0 {
            showLoadingView = true
            Network.shared.apollo.perform(mutation: AppSchema.CheckoutDiscountCodeApplyV2Mutation(checkoutId: checkout?.id ?? "", discountCode: code)) { [weak self] result in
                self?.showLoadingView = false
                switch result {
                case .success(let response):
                    self?.checkout = response.data?.checkoutDiscountCodeApplyV2?.checkout?.fragments.checkoutCommon
                    self?.discountCode = code
                case .failure(let error):
                    print("error===\(error)")
                }
            }
        }
    }

    func removeDiscountCode() {
        showLoadingView = true
        Network.shared.apollo.perform(mutation: AppSchema.CheckoutDiscountCodeRemoveMutation(checkoutId: checkout?.id ?? "")) { [weak self] result in
            self?.showLoadingView = false
            switch result {
            case .success(let response):
                self?.checkout = response.data?.checkoutDiscountCodeRemove?.checkout?.fragments.checkoutCommon
                self?.discountCode = ""
            case .failure(let error):
                print("error===\(error)")
            }
        }
    }

    func checkoutCompleteFree() {
        if Double(checkout?.totalPriceV2.amount ?? "0") == 0 {
            showLoadingView = true
            Network.shared.apollo.perform(mutation: AppSchema.CheckoutCompleteFreeMutation(checkoutId: checkout?.id ?? "")) { result in
                self.showLoadingView = false
                switch result {
                case .success(_):
                    if self.successCallBack != nil {
                        self.successCallBack!()
                    }
                case .failure(let error):
                    print("error===\(error)")
                }
            }
        }
    }
}
