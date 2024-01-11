//
//  LoginVM.swift
//  Unicorn
//
//  Created by Bager on 2024/1/3.
//

import SwiftUI
import Foundation
import Combine
import AppSchema
import Defaults

final class LoginVM: ObservableObject {

//    @Published var showLoading = false // show loading view

    @Published var showLoginAndRegist = false // show current view

    @Published var isLoginOrRegist = true // true: login, false: regist

    @Published var isLoginOrLogout = false // true: login, false: logout

    @Published var loginInputList: [[InputModel]] = []

    @Published var registInputList: [[InputModel]] = []

    var token: String = ""

    var customer: AppSchema.CustomerQuery.Data.Customer?

    init() {
        loginInputList = [
            [InputModel(title: "Email")],
            [InputModel(title: "Password")]
        ]

        registInputList = [
            [InputModel(title: "First Name"), InputModel(title: "Last Name")],
            [InputModel(title: "Email")],
            [InputModel(title: "Password")]
        ]

        token = Defaults[.token]
        if token.count > 0 {
            queryCustomer(showLoadingView: false)
        }
    }

    func loginClick() {
        var hasError = false
        for items in loginInputList {
            for item in items {
                if (item.requireds && item.text.count == 0) {
                    item.showError = true
                    hasError = true
                }
            }
        }

        if !hasError {
            showLoading()
            Network.shared.apollo.perform(mutation: AppSchema.CustomerAccessTokenCreateMutation(input: AppSchema.CustomerAccessTokenCreateInput(email: "bager1@gmail.com", password: "999999"))) {[weak self] result in
                hideLoading()
                switch result {
                case .success(let response):
                    self!.token = response.data?.customerAccessTokenCreate?.customerAccessToken?.accessToken ?? ""
                    Defaults[.token] = self!.token
                    self!.queryCustomer()
                case .failure(let error):
                    print("error===\(error)")
                }
            }

        }
    }

    func registClick() {
        var hasError = false
        for items in registInputList {
            for item in items {
                if (item.requireds && item.text.count == 0) {
                    item.showError = true
                    hasError = true
                }
            }
        }

        if !hasError {
            showLoading()

            Network.shared.apollo.perform(mutation: AppSchema.CustomerCreateMutation(input: AppSchema.CustomerCreateInput(firstName: "Bager", lastName: "Z", email: "bager2@gmail.com", password: "999999", acceptsMarketing: true))) { result in
                hideLoading()
                switch result {
                case .success(let response):
                    self.showLoginAndRegist = true
                    print(response)
                case .failure(let error):
                    print("error===\(error)")
                }
            }
        }
    }


    func subscribeClick() {

    }

    func queryCustomer(showLoadingView: Bool = true) {
        if showLoadingView {
            showLoading()
        } else {
            hideLoading()
        }
        Network.shared.apollo.fetch(query: AppSchema.CustomerQuery(customerAccessToken: token), cachePolicy: .fetchIgnoringCacheData) { [weak self] result in
            hideLoading()
            switch result {
            case .success(let response):
                self!.customer = response.data?.customer
                self!.showLoginAndRegist = false
                self!.isLoginOrLogout = true
            case .failure(let error):
                print("error===\(error)")
            }
        }
    }

    func deleteAddress(id: String) {
        showLoading()
        Network.shared.apollo.perform(mutation: AppSchema.CustomerAddressDeleteMutation(customerAccessToken: Defaults[.token], id: id)) { [weak self] result in
            hideLoading()
            switch result {
            case .success(_):
                self?.queryCustomer(showLoadingView: true)
            case .failure(let error):
                print("error===\(error)")
            }
        }
    }

    func logoutClick() {
        isLoginOrLogout = false
        Defaults[.token] = ""
    }
}
