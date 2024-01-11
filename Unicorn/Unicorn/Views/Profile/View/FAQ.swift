//
//  FAQ.swift
//  Unicorn
//
//  Created by Bager on 2023/12/29.
//

import SwiftUI

struct FAQ: View {

    @State var activeIndex = 0

    var kTitleList = [
        "How do I place an order?",
        "Do I need an account to place an order?",
        "I’ve forgotten my password - what should I do?",
        "What payment methods does Shopify accept?",
        "Afterpay",
        "Klarna (US and AU only)",
        "Which countries doesShopify ship to?",
        "How long does delivery take and how can I track my item?",
        "How much does shipping cost?",
        "Is my package insured?",
        "How do I return an item?",
        "How long does it take to process my refund?",
        "Are Shopify products new or pre-owned?",
        "Are Shopify products authentic?",
        "How do I subscribe to your newsletter?",
        "I can`t find an item that I am looking for?",
    ]

    var titleList: [TextModel] = []

    var faqList : [String] = []

    var selectedCurrencyCode = ""

    func faq() -> String {
        return """
        1. Select a category (Women, Men, Sale) to explore.
        2. Once you have done so, choose your size under the dropdown menu of an item and click “Add to Cart”. You will see a number appear next to the shopping bag icon indicating the number of items you have in your cart.
        3. When you are ready to check out, click on the bag icon and you will be taken to a page with a summary of the items you wish to purchase.
        4. Click on “Proceed to checkout”
        5. Enter your details and address and click “Pay now”.
        """
    }

    func faq1() -> String {
        return "No, you may place an order as a guest. However, we highly recommend that you sign up for an account so you can track and review purchases from your account. You can also save your address and personal details which will allow for a smoother shopping experience next time."
    }

    func faq2() -> String {
        return "On the Log In page, click on the “Forgot password” link and we will email you instructions to reset your password."
    }

    func faq3() -> String {
        if (selectedCurrencyCode == "AUD") {
            return "Shopify accepts Visa, Mastercard, American Express and Afterpay."
        } else if (selectedCurrencyCode == "GBP") {
            return "Shopify accepts Visa, Mastercard and American Express."
        } else if (selectedCurrencyCode == "EUR") {
            return "Shopify accepts Visa, Mastercard and American Express."
        } else {
            return "Shopify accepts Visa, Mastercard, American Express and Afterpay."
        }
    }

    func faq4() -> String {
        if (selectedCurrencyCode == "AUD") {
            return """
          Afterpay is a deferred payment service that allows you to shop today and pay in four payments every 2 weeks without interest.
          The first payment is taken when you place an order and the three remaining payments will be automatically taken from your chosen credit or debit card every 2 weeks. You can also log into your Afterpay account to view all payments due and make payments in advance.

          There is a limit of $2000 AUD per order made with Afterpay.

          For more information, please click here for Afterpay"s Terms and Conditions.
          """
        } else if (selectedCurrencyCode == "GBP") {
            return ""
        } else if (selectedCurrencyCode == "EUR") {
            return ""
        } else if (selectedCurrencyCode == "SGD") {
            return ""
        } else {
            return """
          Afterpay is a deferred payment service that allows you to shop today and pay in four payments every 2 weeks without interest.
          The first payment is taken when you place an order and the three remaining payments will be automatically taken from your chosen credit or debit card every 2 weeks. You can also log into your Afterpay account to view all payments due and make payments in advance.

          There is a limit of USD $2000 per order made with Afterpay.

          For more information, please click here for Afterpay"s Terms and Conditions.
          """
        }
    }

    func faq5() -> String {
        if (selectedCurrencyCode == "AUD") {
            return """
          Klarna offers a flexible way to pay for the things you want. With Klarna, you pay in four interest-free instalments. Each payment is collected from your chosen credit or debit card. The first instalment is paid when you place your order, the subsequent three instalments are paid each fortnight.

          You can log in to the Klarna app to view your payment schedule or make payments in advance.

          For more information, see the Klarna Terms and Conditions.
          """
        } else if (selectedCurrencyCode == "GBP") {
            return ""
        } else if (selectedCurrencyCode == "EUR") {
            return ""
        } else if (selectedCurrencyCode == "SGD") {
            return ""
        } else {
            return """
          Klarna offers a flexible way to pay for the things you want. With Klarna, you pay in four interest-free instalments. Each payment is collected from your chosen credit or debit card. The first instalment is paid when you place your order, the subsequent three instalments are paid each fortnight.

          You can log in to the Klarna app to view your payment schedule or make payments in advance.

          For more information, see the Klarna Terms and Conditions.
          """
        }
    }

    func faq6() -> String {
        return """
Currently, we ship within Australia, United States of America, Canada, Japan, New Zealand, Singapore, South Korea, Hong Kong, China, Indonesia, Philippines, Macau, Taiwan, Thailand, Saudi Arabia, United Arab Emirates, Qatar, Mexico, Argentina, Colombia, Peru and countries within the European Union
    We are growing rapidly and will add other countries soon. Please subscribe to our newsletter if you would like to receive updates.
"""
    }

    func faq7() -> String {
        return "Delivery within Australia takes 3-7 business days. For information on how to track your purchase, please see our Orders and Shipping page."
    }

    func faq8() -> String {
        if (selectedCurrencyCode == "AUD") {
            return "Shipping on orders over AUD 300 is free. A nominal shipping fee is charged for orders under AUD 300."
        } else if (selectedCurrencyCode == "GBP") {
            return "Shipping on orders over GBP 200 is free. A nominal shipping fee is charged for orders under GBP 200."
        } else if (selectedCurrencyCode == "EUR") {
            return "Shipping on orders over EUR 200 is free. A nominal shipping fee is charged for orders under EUR 200."
        } else if (selectedCurrencyCode == "SGD") {
            return "Shipping on orders over SGD 250 is free. A nominal shipping fee is charged for orders under SGD 250."
        } else {
            return "Shipping on orders over USD 250 is free. A nominal shipping fee is charged for orders under USD 250."
        }
    }

    func faq9() -> String {
        return "Yes we insure every package while in transit to our customers."
    }

    func faq10() -> String {
        return """
Go to your account at the top right corner where it says your name. Click "Create Return" next to the order you would like to return and follow the prompts. If you encounter any problems, please contact our customer service at customerservice@Shopify.com
    If you checked out as a guest, please sign up for an account with the same email address you used to make the order and initiate a return from there.
"""
    }

    func faq11() -> String {
        return "Please note that refunds may take up to 10 working days to process due to varying processing times between payment providers. To ensure your refund is as quick as possible, please see our Returns Policy"
    }

    func faq12() -> String {
        return "We only sell new items."
    }

    func faq13() -> String {
        return "All products are guaranteed to be authentic."
    }

    func faq14() -> String {
        return "In the footer of the homepage, there is a text box under “Sign up for our newsletter” where you can enter your email address. You will then receive an email notifying you that you are subscribed. Our subscribers are the first to receive sale alerts, new arrivals and discount codes."
    }

    func faq15() -> String {
        return "Please email our customer care at customerservice@Shopify.com and we will do our best to help."
    }

    init() {
        faqList = [faq(), faq1(), faq2(), faq3(), faq4(), faq5(), faq6(), faq7(), faq8(), faq9(), faq10(), faq11(), faq12(), faq13(), faq14(), faq15()]

        kTitleList.forEach { name in
            titleList.append(TextModel(names: name))
        }

    }

    var body: some View {
        List {
            ForEach(0..<titleList.count, id: \.self) { index in
                let item = titleList[index]
                VStack(spacing: 0) {
                    HStack {
                        Text(item.name)
                            .modifier(TextBlack16())
                        Spacer()
                        Image(activeIndex == index ? "arrow_up" : "arrow_down")
                    }
                    .frame(height: 44)
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                    activeIndex == index
                    ? Text(faqList[index])
                        .lineSpacing(7)
                        .modifier(TextBlack16())
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
                    : nil
                    Divider()
                }
                .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                .listRowSeparator(.hidden)
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation {
                        activeIndex = index
                    }
                }
            }
        }
        .background(.white)
        .scrollContentBackground(.hidden)
        .listStyle(.plain)
        .environment(\.defaultMinListRowHeight, 30)
        .navigationTitle("FAQ")
        .navigationBarTitleDisplayMode(.inline)
        .navBackButton()
        .toolbar(.hidden, for: .tabBar)

    }
}

#Preview {
    FAQ()
}
