    //
    //  Profile.swift
    //  Unicorn
    //
    //  Created by Bager on 2023/12/13.
    //

import SwiftUI

struct Profile: View {

    @State private var path = NavigationPath()

    @EnvironmentObject var loginVM: LoginVM

    var body: some View {
        NavigationStack(path: $path) {
            content
                .navigationTitle("Profile")
                .navigationBarTitleDisplayMode(.inline)
                .modifier(SetNavCartButton(path: $path))
                .navigationDestination(for: RouterModel.self) { route in
                    route.destination.view($path, params: route.params)
                }
        }
    }

    var content: some View {
        List() {
            if loginVM.isLoginOrLogout {
                VStack(alignment: .leading) {
                    Text("Welcome \(loginVM.customer?.displayName ?? "")")
                        .modifier(TextBlack16())
                        .frame(height: 20)
                    Text("Sign out")
                        .modifier(TextGrey75757514())
                        .onTapGesture {
                            loginVM.logoutClick()
                        }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 16)
                .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                .listRowSeparator(.hidden)
            } else {
                LoginView()
                    .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .listRowSeparator(.hidden)
            }
            if loginVM.isLoginOrLogout {
                Section {
                    ListItem(name: "My Orders")
                        .onTapGesture {
                            path.append(RouterModel(destination: .myOrder))
                        }
                    ListItem(name: "Saved Address")
                        .onTapGesture {
                            path.append(RouterModel(destination: .saveAddress))
                        }
                }
            }
            Section() {
                ListItem(name: "Region")
                    .onTapGesture {
                        path.append(RouterModel(destination: .region))
                    }
                ListItem(name: "Notifications")
                    .onTapGesture {
                        path.append(RouterModel(destination: .notifications))
                    }
            } header: {
                Text("Setting")
                    .modifier(TextBlack14())
                    .listRowSeparator(.hidden)
                    .listRowInsets(.init(top: 0, leading: 16, bottom: 0, trailing: 0))
            }
            Section() {
                ListItem(name: "About")
                    .onTapGesture {
                        path.append(RouterModel(destination: .about))
                    }
                ListItem(name: "Help and Contacts")
                    .onTapGesture {
                        path.append(RouterModel(destination: .helpAndContact))
                    }
                ListItem(name: "FAQ")
                    .onTapGesture {
                        path.append(RouterModel(destination: .faq))
                    }
                ListItem(name: "Return and Refunds")
                    .onTapGesture {
                        path.append(RouterModel(destination: .returnAndRefund))
                    }
            } header: {
                Text("Support")
                    .modifier(TextBlack14())
                    .listRowSeparator(.hidden)
                    .listRowInsets(.init(top: 0, leading: 16, bottom: 0, trailing: 0))
            }

            if loginVM.isLoginOrLogout {
                Button("Log out") {
                    loginVM.logoutClick()
                }
                .modifier(TextBlack16())
                .frame(width: 108, height: 32)
                .border(.black)
                .padding(EdgeInsets(top: 40, leading: kScreenWidth / 2.0 - 54, bottom: 30, trailing: 0))
                .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                .listRowSeparator(.hidden)
            }

            Section() {
                ListItemS(name: "Terms and Conditions", rowHeight: 30)
                    .onTapGesture {
                        path.append(RouterModel(destination: .termsAndConditions))
                    }
                ListItemS(name: "Privacy Policy", rowHeight: 30)
                    .onTapGesture {
                        path.append(RouterModel(destination: .privacyPolicy))
                    }
                ListItemS(name: "App Version 1.0.0", rowHeight: 30)
            } header: {
                Text("")
            }
        }
        .background(.white)
        .scrollContentBackground(.hidden)
        .listStyle(.plain)
        .environment(\.defaultMinListRowHeight, 30)
    }
}

struct ListItem: View {

    var name: String
    var rowHeight: Double = 44

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(name)
                    .modifier(TextBlack16())
                Spacer()
                Image("arrow")
            }
            .frame(height: rowHeight)
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            .contentShape(Rectangle())
            Divider()
        }
        .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
        .listRowSeparator(.hidden)
    }
}

struct ListItemS: View {

    var name: String
    var rowHeight: Double = 30

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                name.hasPrefix("App Version") ?
                AnyView(Text(name).modifier(TextGrey9E9E9E14())) :
                AnyView(Text(name).modifier(TextBlack14()))
                Spacer()
            }
            .frame(height: rowHeight)
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
        }
        .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
        .listRowSeparator(.hidden)
    }
}

struct LoginView: View {

    @EnvironmentObject var loginVM: LoginVM

    var body: some View {
        VStack(spacing: 16) {
            Text("Login")
                .modifier(TextBlack16())
            Text("Login to manage your orders and \n fast-track checkout")
                .modifier(TextBlack16())
                .multilineTextAlignment(.center)
            HStack {
                Button {
                    loginVM.showLoginAndRegist = true
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
                    loginVM.showLoginAndRegist = true
                    loginVM.isLoginOrRegist = false
                } label: {
                    Text("Register")
                        .font(.system(size: 16))
                        .frame(height: 40)
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .foregroundColor(.black)
                        .border(.black)
                        .cornerRadius(2)
                }
                .buttonStyle(.plain)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
        }
        .padding(.vertical, 16)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .fullScreenCover(isPresented: $loginVM.showLoginAndRegist) {
            Login()
        }
    }
}

#Preview {
    Profile()
}
