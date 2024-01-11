    //
    //  Login.swift
    //  Unicorn
    //
    //  Created by Bager on 2024/1/4.
    //

import SwiftUI

struct Login: View {

    @EnvironmentObject var loginVM: LoginVM

    var body: some View {
        NavigationStack {
            content
                .navigationTitle("")
                .navigationBarTitleDisplayMode(.inline)
                .modifier(SetNavBackButton(imageStr: "nav_close"))
        }
    }

    var content: some View {
        loginVM.isLoginOrRegist ? AnyView(loginView) : AnyView(registView)
    }

    var loginView: some View {
        VStack(spacing: 0) {
            Text("Shopify")
                .font(.system(size: 30))
                .fontWeight(.bold)
                .frame(maxHeight: .infinity)

            ForEach(0..<loginVM.loginInputList.count, id: \.self) { index in
                let items = loginVM.loginInputList[index]
                HStack(spacing: 0) {
                    ForEach(0..<items.count, id: \.self) { i in
                        let item = items[i]
                        InputView(item: item)
                    }
                }
                .padding(.horizontal, 16)
            }

            VStack {
                Button {
                    loginVM.loginClick()
                } label: {
                    Text("Login")
                        .font(.system(size: 16))
                        .frame(height: 40)
                        .frame(maxWidth: .infinity)
                        .background(.black)
                        .foregroundColor(.white)
                        .cornerRadius(2)
                }
                .buttonStyle(.plain)
                Button {
                    loginVM.isLoginOrRegist = false
                } label: {
                    Text("Create a new account")
                        .font(.system(size: 16))
                        .frame(height: 40)
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .foregroundColor(.black)
                        .border(.black)
                        .cornerRadius(2)
                }
                .buttonStyle(.plain)

                Text("Continue as guest")
                    .modifier(TextGrey75757512())
                    .padding(.vertical, 10)
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 16)

        }
    }

    var attributedString: AttributedString {
        let string = "By signing up you agree with our \n Terms & Conditions and Privacy Policy"
        var attributedString = AttributedString(string)
        attributedString.font = .systemFont(ofSize: 12)
        attributedString.foregroundColor = .black
        if let range = attributedString.range(of: "Terms & Conditions") {
            attributedString[range].foregroundColor = Color(AppColor.grey_9e9e9e)
        }
        if let range = attributedString.range(of: "Privacy Policy") {
            attributedString[range].foregroundColor = Color(AppColor.grey_9e9e9e)
        }
        return attributedString
    }

    var registView: some View {
        VStack(spacing: 0) {
            Text("Shopify")
                .font(.system(size: 30))
                .fontWeight(.bold)
                .frame(maxHeight: .infinity)

            ForEach(0..<loginVM.registInputList.count, id: \.self) { index in
                let items = loginVM.registInputList[index]
                HStack(spacing: 10) {
                    ForEach(0..<items.count, id: \.self) { i in
                        let item = items[i]
                        InputView(item: item)
                    }
                }
                .padding(.horizontal, 16)
            }

            VStack {
                Button {
                    loginVM.registClick()
                } label: {
                    Text("Create account")
                        .font(.system(size: 16))
                        .frame(height: 40)
                        .frame(maxWidth: .infinity)
                        .background(.black)
                        .foregroundColor(.white)
                        .cornerRadius(2)
                }
                .buttonStyle(.plain)
                Button {
                    loginVM.isLoginOrRegist = true
                } label: {
                    Text("Back to login")
                        .font(.system(size: 16))
                        .frame(height: 40)
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .foregroundColor(.black)
                        .border(.black)
                        .cornerRadius(2)
                }
                .buttonStyle(.plain)

                Text(attributedString)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 10)
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 16)

        }
    }
}
