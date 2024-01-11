    //
    //  Checkout.swift
    //  Unicorn
    //
    //  Created by Bager on 2024/1/8.
    //

import SwiftUI
import PopupView

struct Checkout: View {

    @Binding var path: NavigationPath

    @EnvironmentObject var cartVM: CartVM

    @ObservedObject
    var vm : CheckoutVM = CheckoutVM()

    @ObservedObject
    var countryListVM = CountryListVM()

    var body: some View {
        content
            .navigationBarTitleDisplayMode(.inline)
            .navBackButton()
            .toolbar {
                ToolbarItem(placement: .principal) {
                    menu
                }
            }
            .fullScreenCover(isPresented: $vm.showCountryList) {
                LazyView(CountryList(vm: countryListVM, callBack: { callBack in
                    vm.selectCountry(country: callBack as! CountryModel)
                }))
            }
            .popup(isPresented: $vm.showToast) {
                HStack {
                    Text("Please select a shipping method")
                        .modifier(TextWhite14())
                        .padding(.horizontal, 10)
                    Spacer()
                }
                .frame(width: kScreenWidth - 32, height: 40)
                .background(.black)
                .cornerRadius(4)
            } customize: { $0
                .type(.floater(verticalPadding: 10, horizontalPadding: 16, useSafeAreaInset: true))
                .position(.top)
                .animation(.spring())
                .closeOnTapOutside(true)
                .closeOnTap(false)
                .backgroundColor(.black.opacity(0.0))
                .autohideIn(2)
            }
            .onAppear() {
                let appearance = UINavigationBarAppearance()
                appearance.backgroundColor = .white
                UINavigationBar.appearance().standardAppearance = appearance
                UINavigationBar.appearance().scrollEdgeAppearance = appearance

                self.vm.initData(countryListVM: countryListVM, cartVM: cartVM)
                self.vm.successCallBack = {
                    path.removeLast()
                    path.append(RouterModel(destination: .checkoutComplete, params: ["email": vm.addressInputList[2][0].text]))
                }
            }
    }

    var menu: some View {
        HStack {
            (vm.page == .Address ? AnyView(Text("Address")
                .modifier(TextBlack16())) : AnyView(Text("Address")
                    .modifier(TextGrey9E9E9E16())))
            .onTapGesture {
                if vm.page.rawValue > 0 {
                    vm.page = .Address
                }
            }
            (vm.page == .Delivery ? AnyView(Text("Delivery")
                .modifier(TextBlack16())) : AnyView(Text("Delivery")
                    .modifier(TextGrey9E9E9E16())))
            .onTapGesture {
                if vm.page.rawValue > 1 {
                    vm.page = .Delivery
                }
            }
            vm.page == .Payment ? AnyView(Text("Payment")
                .modifier(TextBlack16())) : AnyView(Text("Payment")
                    .modifier(TextGrey9E9E9E16()))
        }
    }

    var content: some View {
        VStack {
            switch vm.page {
            case .Address:
                addressView
            case .Delivery:
                deliveryView
            case .Payment:
                paymentView
            }
            bottomView
        }
        .overlay(Group {
            if vm.showLoadingView {
                Loading()
            } else {
                EmptyView()
            }
        })
    }

    var addressView: some View {
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
                            VStack {
                                InputView(item: item)
                                if item.title == "Email" {
                                    HStack() {
                                        Image("select_y")
                                        Text("Subscribe to our newsletter")
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
            HStack() {
                Image("select_y")
                Text("Save address for next purchase")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }

    var deliveryView: some View {
        ScrollView {
            HStack {
                Text("Contact")
                    .modifier(TextBlack12())
                    .fontWeight(.bold)
                    .frame(minWidth: 60, alignment: .leading)
                Text(vm.addressInputList[2][0].text)
                    .modifier(TextBlack12())
                    .tint(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
            HStack {
                Text("Address")
                    .modifier(TextBlack12())
                    .fontWeight(.bold)
                    .frame(minWidth: 60, alignment: .leading)

                Text("\(vm.addressInputList[4][0].text) \(vm.addressInputList[5][0].text) \(vm.addressInputList[6][0].text) \(vm.addressInputList[7][1].text) \(vm.addressInputList[3][0].text)")
                    .modifier(TextBlack12())
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            Divider()
                .padding(.horizontal, 16)
            Text("*Shipping Methods")
                .modifier(TextBlack12())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
            ForEach(0..<vm.shippingRates.count, id: \.self) { index in
                let item = vm.shippingRates[index]
                HStack(alignment: .top, spacing: 20) {
                    if vm.shippingLine != nil && vm.shippingLine?.title == item.title {
                        Image("selected")
                    } else {
                        Image("unselected")
                    }
                    VStack(alignment:.leading, spacing: 10) {
                        Text(item.title)
                            .modifier(TextBlack16())
                        Text("\(item.priceV2.currencyCode.rawValue) \(item.priceV2.amount)")
                            .modifier(TextBlack12())
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    vm.updateShippingLine(index: index)
                }
                .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                .border(Color(AppColor.grey_eeeeee))
                .frame(maxWidth: .infinity, alignment: .topLeading)
            }
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 16))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }

    var paymentView: some View {
        ScrollView {
            HStack {
                Text("Contact")
                    .modifier(TextBlack12())
                    .fontWeight(.bold)
                    .frame(minWidth: 60, alignment: .leading)
                Text(vm.addressInputList[2][0].text)
                    .modifier(TextBlack12())
                    .tint(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
            HStack {
                Text("Address")
                    .modifier(TextBlack12())
                    .fontWeight(.bold)
                    .frame(minWidth: 60, alignment: .leading)
                Text("\(vm.addressInputList[4][0].text) \(vm.addressInputList[5][0].text) \(vm.addressInputList[6][0].text) \(vm.addressInputList[7][1].text) \(vm.addressInputList[3][0].text)")
                    .modifier(TextBlack12())
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 0, trailing: 16))
            HStack {
                Text("Delivery")
                    .modifier(TextBlack12())
                    .fontWeight(.bold)
                    .frame(minWidth: 60, alignment: .leading)
                Text(vm.shippingLine?.title ?? "")
                    .modifier(TextBlack12())
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            Divider()
                .padding(.horizontal, 16)
            Text("Payment")
                .modifier(TextBlack12())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
            Text("All transactions are secure and encrypted.")
                .modifier(TextBlack12())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(EdgeInsets(top: 4, leading: 16, bottom: 0, trailing: 16))

            if (Double(vm.checkout?.totalPriceV2.amount ?? "0") == 0) {
                AnyView(VStack(alignment: .center, spacing: 0) {
                    Image("payment_free")
                    Text("This order is covered by your gift card.")
                        .modifier(TextBlack14())
                        .padding(EdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 0))
                }
                    .frame(maxWidth: .infinity)
                    .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                    .border(Color(AppColor.grey_eeeeee))
                    .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)))
            } else {
                AnyView(VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Text("Credit or Debit Card")
                            .modifier(TextBlack16())
                        Spacer()
                        Image("pay_type")
                    }
                    InputView(item: InputModel(title: "Card Number", hideTitle: true, lineColor: Color(AppColor.grey_eeeeee)))
                    InputView(item: InputModel(title: "MM / YY", hideTitle: true, lineColor: Color(AppColor.grey_eeeeee)))
                        .frame(width: (kScreenWidth - 64) / 2.0)
                    InputView(item: InputModel(title: "Name on Card", hideTitle: true, lineColor: Color(AppColor.grey_eeeeee)))
                    HStack {
                        InputView(item: InputModel(title: "Security code", hideTitle: true, lineColor: Color(AppColor.grey_eeeeee)))
                            .frame(width: (kScreenWidth - 64) / 2.0)
                        Image("credit")
                    }
                    Text("The security number is the three digits on the back of the card in the signature box.")
                        .modifier(TextBlack14())
                        .padding(EdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 0))
                }
                    .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                    .border(Color(AppColor.grey_eeeeee))
                    .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)))
            }


            Text("Billing Address")
                .modifier(TextBlack12())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
            Text("Same as shipping address")
                .modifier(TextGrey75757512())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(EdgeInsets(top: 4, leading: 16, bottom: 0, trailing: 16))
            Text("shipping address")
                .modifier(TextBlack14())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(EdgeInsets(top: 4, leading: 16, bottom: 0, trailing: 16))
            Divider()
                .padding(.horizontal, 16)
                .padding(.vertical, 16)
            HStack {
                Image("pen")
                Text("Edit")
                    .modifier(TextBlack14())
                Spacer()
                Image("arrow")
            }
            .padding(.horizontal, 16)
            Text("Add code")
                .modifier(TextBlack12())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(EdgeInsets(top: 32, leading: 16, bottom: 0, trailing: 16))
            HStack {
                InputView(item: vm.discountModel)
                Text("Apply")
                    .modifier(TextBlack16())
                    .frame(maxHeight: .infinity)
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                    .border(.black)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                    .onTapGesture {
                        vm.appleyDiscountCode()
                    }
            }
            .padding(.horizontal, 16)

            if (vm.discountCode.count > 0) {
                HStack {
                    Text("\(vm.discountCode)  ×")
                        .modifier(TextBlack16())
                        .frame(height: 50)
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                        .border(.black)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                    Spacer()
                }
                .padding(.horizontal, 16)
                .contentShape(Rectangle())
                .onTapGesture {
                    vm.removeDiscountCode()
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }

    var bottomView: some View {
        VStack {
            Divider()
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text("Subtotal     \(vm.checkout?.subtotalPriceV2.currencyCode.rawValue ?? "USD") \(vm.checkout?.subtotalPriceV2.amount ?? "0")")
                        .modifier(TextBlack14())
                    Spacer()
                    Text("Totat \(vm.checkout?.totalPriceV2.currencyCode.rawValue ?? "USD") \(vm.checkout?.totalPriceV2.amount ?? "0")")
                        .modifier(TextBlack14())
                        .fontWeight(.bold)
                }
                if vm.shippingLine != nil {
                    Text("Shipping    \(vm.shippingLine?.priceV2.currencyCode.rawValue ?? "USD") \(vm.shippingLine?.priceV2.amount ?? "0")")
                        .modifier(TextBlack14())
                } else {
                    Text("Shipping    CNY 0.0")
                        .modifier(TextBlack14())
                }
                Text("Tax             \(vm.checkout?.totalTaxV2.currencyCode.rawValue ?? "USD") \(vm.checkout?.totalTaxV2.amount ?? "0")")
                    .modifier(TextBlack14())

                let lineItemsSubtotalPrice = Double(vm.checkout?.lineItemsSubtotalPrice.amount ?? "") ?? 0
                let subtotalPriceV2 = Double(vm.checkout?.subtotalPriceV2.amount ?? "") ?? 0
                let discountValue = String(format: "%.2f", lineItemsSubtotalPrice - subtotalPriceV2)

                Text("Discount    \(vm.checkout?.subtotalPriceV2.currencyCode.rawValue ?? "USD") \(discountValue)")
                    .modifier(TextBlack14())
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 10)
            Button {
                vm.nextClick()
            } label: {
                Text(vm.page == .Payment ? "Place Order" : "Next")
                    .font(.system(size: 16))
                    .frame(height: 40)
                    .frame(maxWidth: .infinity)
                    .background(.black)
                    .foregroundColor(.white)
                    .cornerRadius(2)
            }
            .buttonStyle(.plain)
        }
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 10, trailing: 16))
    }
}
