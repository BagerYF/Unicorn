//
//  OrderList.swift
//  Unicorn
//
//  Created by Bager on 2024/1/5.
//

import SwiftUI
import AppSchema
import Kingfisher

struct OrderList: View {

    @EnvironmentObject var loginVM: LoginVM

    var body: some View {
        content
            .navigationTitle("My Orders")
            .navigationBarTitleDisplayMode(.inline)
            .navBackButton()
            .toolbar(.hidden, for: .tabBar)
            .onAppear() {
                loginVM.queryCustomer(showLoadingView: true)
            }
    }

    var content: some View {
        List {
            ForEach(loginVM.customer?.orders.edges ?? [], id: \.self) { item in
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Text("Order# ")
                            .modifier(TextBlack14())
                        Text("\(item.node.orderNumber)")
                            .modifier(TextGrey9E9E9E14())
                        Spacer()
                        Text(item.node.processedAt.prefix(10))
                            .modifier(TextBlack14())
                        Image("arrow")
                    }
                    .frame(height: 44)
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                    KFImage(URL(string: "\(item.node.lineItems.edges.first?.node.variant?.image?.url ?? "")"))
                        .resizable()
                        .frame(width: 72, height: 72)
                        .padding(EdgeInsets(top: 10, leading: 16, bottom: 10, trailing: 16))
                    Divider()
                }
                .background(
                    NavigationLink(destination: LazyView(OrderDetail(item: item))) {}
                        .opacity(0)
                )
                .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                .listRowSeparator(.hidden)
            }
        }
        .frame(height: kScreenHeight - UIDevice.navigationFullHeight() - 60)
        .padding(0)
        .background(.white)
        .scrollContentBackground(.hidden)
        .listStyle(.plain)
        .environment(\.defaultMinListRowHeight, 30)
    }
}

#Preview {
    OrderList()
}
