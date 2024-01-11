//
//  OrderDetail.swift
//  Unicorn
//
//  Created by Bager on 2024/1/5.
//

import SwiftUI
import Kingfisher
import AppSchema

struct OrderDetail: View {

    var item: AppSchema.CustomerQuery.Data.Customer.Orders.Edge

    var body: some View {
        content
            .navigationTitle("#\(item.node.orderNumber)")
            .navigationBarTitleDisplayMode(.inline)
            .navBackButton()
            .toolbar(.hidden, for: .tabBar)
//            .ignoresSafeArea(edges: .bottom)
    }

    var lineHeight: Double = 20.0

    var content: some View {
        ScrollView {
            HStack {
                Text("Subtotal")
                    .modifier(TextGrey9E9E9E14())
                    .frame(minWidth: 110, alignment: .leading)
                Text("\(item.node.subtotalPriceV2?.currencyCode.rawValue ?? "") \(item.node.subtotalPriceV2?.amount ?? "")")
                    .modifier(TextBlack14())
            }
            .frame(minHeight: lineHeight)
            .frame(maxWidth: .infinity, alignment: .leading)
            HStack {
                Text("Shipping")
                    .modifier(TextGrey9E9E9E14())
                    .frame(minWidth: 110, alignment: .leading)
                Text("\(item.node.totalShippingPriceV2.currencyCode.rawValue ?? "") \(item.node.totalShippingPriceV2.amount ?? "")")
                    .modifier(TextBlack14())
            }
            .frame(minHeight: lineHeight)
            .frame(maxWidth: .infinity, alignment: .leading)
            HStack {
                Text("Taxes")
                    .modifier(TextGrey9E9E9E14())
                    .frame(minWidth: 110, alignment: .leading)
                Text("\(item.node.totalTaxV2?.currencyCode.rawValue ?? "") \(item.node.totalTaxV2?.amount ?? "")")
                    .modifier(TextBlack14())
                Spacer()
                Text("Total \(item.node.totalPriceV2.currencyCode.rawValue ) \(item.node.totalPriceV2.amount )")
                    .modifier(TextBlack16())
            }
            .frame(minHeight: lineHeight)
            Divider()
            HStack {
                Text("Order Number")
                    .modifier(TextGrey9E9E9E14())
                    .frame(minWidth: 110, alignment: .leading)
                Text("\(item.node.orderNumber )")
                    .modifier(TextBlack14())
            }
            .frame(minHeight: lineHeight)
            .frame(maxWidth: .infinity, alignment: .leading)
            HStack {
                Text("Order Date")
                    .modifier(TextGrey9E9E9E14())
                    .frame(minWidth: 110, alignment: .leading)
                Text("\(String(item.node.processedAt.prefix(10) ))")
                    .modifier(TextBlack14())
            }
            .frame(minHeight: lineHeight)
            .frame(maxWidth: .infinity, alignment: .leading)
            Divider()
            HStack(alignment: .top) {
                Text("Shipping")
                    .modifier(TextGrey9E9E9E14())
                    .frame(minWidth: 110, alignment: .leading)
                Text("International Priority Express Shipping")
                    .modifier(TextBlack14())
            }
            .frame(minHeight: lineHeight)
            .frame(maxWidth: .infinity, alignment: .leading)
            Divider()
            HStack {
                Text("Contact")
                    .modifier(TextGrey9E9E9E14())
                    .frame(minWidth: 110, alignment: .leading)
                Text("\(item.node.email ?? "")")
                    .modifier(TextBlack14())
            }
            .frame(minHeight: lineHeight)
            .frame(maxWidth: .infinity, alignment: .leading)
            HStack(alignment: .top) {
                Text("Shipping")
                    .modifier(TextGrey9E9E9E14())
                    .frame(minWidth: 110, alignment: .leading)
                Text("\(item.node.shippingAddress?.firstName ?? "") \(item.node.shippingAddress?.lastName ?? "") \n\(item.node.shippingAddress?.address1 ?? "") \(item.node.shippingAddress?.address2 ?? "") \(item.node.shippingAddress?.city ?? "") \n\(item.node.shippingAddress?.province ?? "") \(item.node.shippingAddress?.zip ?? "") \(item.node.shippingAddress?.country ?? "")")
                    .modifier(TextBlack14())
            }
            .frame(minHeight: lineHeight)
            .frame(maxWidth: .infinity, alignment: .leading)
            Divider()

            ForEach(item.node.lineItems.edges , id: \.self) { sItem in
                OrderProductItem(item: sItem)
            }

            ContactView()
        }
        .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .scrollIndicators(.hidden)
    }
}

struct OrderProductItem: View {

    var item: AppSchema.CustomerQuery.Data.Customer.Orders.Edge.Node.LineItems.Edge

    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .top, spacing: 16) {
                KFImage(URL(string: item.node.variant?.image?.url ?? AppConstants.ImagePlaceHolder))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                .frame(width: 104, height: 156)
                VStack(alignment: .leading, spacing: 10) {
                    Text(item.node.variant?.product.productType ?? "")
                    .modifier(TextBlack14())
                    Text(item.node.title)
                        .modifier(TextBlack14())
                    Text("Size \(item.node.variant?.title ?? "")")
                        .modifier(TextGrey75757514())
                    Text("Qty \(item.node.quantity)")
                        .modifier(TextGrey75757514())
                }
            }
            HStack(spacing: 16) {
                Text("")
                    .modifier(TextGrey75757512())
                    .frame(width: 104)
                Text("Price")
                    .modifier(TextGrey75757514())
                Spacer()
                Text("\((item.node.originalTotalPrice.currencyCode ).rawValue) \(item.node.originalTotalPrice.amount )")
                    .modifier(TextBlack14())
            }
            .padding(.vertical, 16)
            Divider()
        }
        .padding(.vertical, 16)
    }
}

struct ContactView : View {
    var body: some View {
        VStack {
            VStack(spacing: 10) {
                Image("icon_order_problem")
                Text("Help and Contact")
                    .modifier(TextBlack14())
                Text("Questions about your\norder? Don't hesitate to ask")
                    .modifier(TextGrey75757512())
                    .multilineTextAlignment(.center)
                Text("Contact Shopify")
                    .modifier(TextGrey9E9E9E14())
                    .underline()
            }
            .padding(.vertical, 30)
            Divider()
            VStack(alignment: .leading, spacing: 10) {
                Text("Return Information")
                    .modifier(TextBlack14())
                Text("The eligible return period for this item(s) has expired. For more information, see our Return Policy.")
                    .modifier(TextGrey75757512())
                Text("Return Policy")
                    .modifier(TextGrey9E9E9E14())
                    .underline()
            }
            .padding(.vertical, 20)
        }
    }
}

#Preview {
    ContactView()
}
