//
//  AddressList.swift
//  Unicorn
//
//  Created by Bager on 2024/1/5.
//

import SwiftUI
import AppSchema
import Kingfisher

struct AddressList: View {

    @EnvironmentObject var loginVM: LoginVM

    var body: some View {
        content
            .navigationTitle("Address")
            .navigationBarTitleDisplayMode(.inline)
            .navBackButton()
            .toolbar(.hidden, for: .tabBar)
            .onAppear() {
                loginVM.queryCustomer()
            }
    }

    var content: some View {
        VStack {
            List {
                ForEach(loginVM.customer?.addresses.edges ?? [], id: \.self) { item in
                    VStack(alignment: .leading, spacing: 0) {
                        VStack {
                            Text("\(item.node.firstName ?? "") \(item.node.lastName ?? "") \n\(item.node.address1 ?? "") \(item.node.address2 ?? "") \(item.node.city ?? "") \n\(item.node.province ?? "") \(item.node.zip ?? "") \(item.node.country ?? "")")
                                .modifier(TextBlack14())
                                .lineSpacing(10)
                        }
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                        HStack {
                            Spacer()
                            HStack(spacing: 3) {
                                Image("address_edit")
                                Text("Edit")
                                    .modifier(TextBlack14())
                            }
                            .background(
                                NavigationLink(destination: LazyView(AddressDetail(data: item))
                                ) {}
                                    .opacity(0)
                            )
                            HStack(spacing: 3) {
                                Image("address_del")
                                Text("Delete")
                                    .modifier(TextBlack14())
                            }
                            .onTapGesture {
                                loginVM.deleteAddress(id: item.node.id)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 16)
                        Divider()
                    }
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                    .background(
                        //                    NavigationLink(destination: LazyView(OrderDetail(item: item))) {}
                        //                        .opacity(0)
                    )
                    .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .listRowSeparator(.hidden)
                }
            }
            .padding(0)
            .background(.white)
            .scrollContentBackground(.hidden)
            .listStyle(.plain)
            .environment(\.defaultMinListRowHeight, 30)

            HStack {
                Button {
                    
                } label: {
                    NavigationLink(destination: LazyView(AddressDetail())) {
                        Text("Add address")
                            .font(.system(size: 16))
                            .frame(height: 40)
                            .frame(maxWidth: .infinity)
                            .background(.black)
                            .foregroundColor(.white)
                            .cornerRadius(2)
                    }
                }
            .buttonStyle(.plain)
            .padding(.horizontal, 16)
            }
        }
    }
}
