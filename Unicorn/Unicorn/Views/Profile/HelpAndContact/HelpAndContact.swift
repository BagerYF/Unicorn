    //
    //  HelpAndContact.swift
    //  Unicorn
    //
    //  Created by Bager on 2024/1/7.
    //

import SwiftUI

struct HelpAndContact: View {

    @State var related = true
    @State var showType = false
    @State var type = ""
    @State var typeIndex = 0

    let typeData: [String] = [
        "Trouble placing an order",
        "Product information",
        "Status of my order",
        "Delivery tracking",
        "Product I received",
        "Returns",
        "Refunds",
        "Change my address",
    ]

    var body: some View {
        content
            .navigationTitle("Help and Contact")
            .navigationBarTitleDisplayMode(.inline)
            .navBackButton()
            .toolbar(.hidden, for: .tabBar)
            .popup(isPresented: $showType) {
                VStack {
                    HStack(alignment: .top){
                        Text("Please select an enquiry type")
                            .modifier(TextBlack14())
                        Spacer()
                        Image("filter_del")
                            .onTapGesture {
                                showType = false
                            }
                    }
                    .padding(.vertical, 10)
                    ZStack {
                        Picker(selection: $typeIndex, label: Text("Type")) {
                            ForEach(0..<typeData.count, id: \.self) { index in
                                HStack {
                                    Text(typeData[index])
                                        .modifier(TextBlack14())
                                }
                                .padding(.horizontal, 16)
                                .tag(index)
                            }
                        }
                        .pickerStyle(.wheel)
                    }
                    Button(action: {
                        showType = false
                        type = typeData[typeIndex]
                    }, label: {
                        Text("Select")
                            .frame(width: kScreenWidth - 32, height: 44)
                            .background(.black)
                            .foregroundColor(.white)
                            .cornerRadius(4)
                    })
                    .buttonStyle(PlainButtonStyle())
                }
                .background(.white)
                .safeAreaPadding()

            } customize: { $0
                .type(.toast)
                .position(.bottom)
                .animation(.spring())
                .closeOnTapOutside(true)
                .closeOnTap(false)
                .backgroundColor(.black.opacity(0.3))
                .dragToDismiss(false)
            }
    }

    var content: some View {
        VStack {
            ScrollView() {
                Text("""
    To submit an inquiry simply complete the contact form below and tap ‘Send’.  We aim to get back to you in one business day.

    For information relating to common questions and inquiries please see the links below:
    """)
                .modifier(TextBlack16())

                VStack(alignment: .leading) {
                    Text("""
        Frequently Asked Questions
        Orders and Shipping
        Returns and Refunds
        """)
                    .modifier(TextGrey9E9E9E16())
                    .underline()
                    .lineSpacing(8)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 16)

                HStack {
                    Text("Contact Form")
                        .modifier(TextBlack16())
                    .fontWeight(.bold)
                    Spacer()
                }
                .padding(.vertical, 10)

                InputView(item: InputModel(title: "Name"))
                InputView(item: InputModel(title: "Email"))
                InputView(item: InputModel(title: "Phone", optional: true, requireds: false))

                VStack(alignment: .leading) {
                    Text("Is this Enquiry related to an existing order?*")
                        .modifier(TextBlack16())
                    HStack {
                        HStack {
                            related ? Image("selected") : Image("unselected")
                            Text("Yes")
                                .modifier(TextBlack14())
                        }
                        .onTapGesture {
                            related.toggle()
                        }
                        HStack {
                            related ? Image("unselected") : Image("selected")
                            Text("No")
                                .modifier(TextBlack14())
                        }
                        .onTapGesture {
                            related.toggle()
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 16)


                InputView(item: InputModel(title: "Enquiry Type", text: type, callBack: {
                    showType = true
                }, rightImg: "arrow_down", placeHolder: "Tell us about your enquiry"))
                InputView(item: InputModel(title: "Message", placeHolder: "Type your message here"))
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 16)
            .scrollIndicators(.hidden)

            Button {

            } label: {
                Text("Send")
                    .font(.system(size: 16))
                    .frame(height: 40)
                    .frame(maxWidth: .infinity)
                    .background(.black)
                    .foregroundColor(.white)
                    .cornerRadius(2)
            }
            .buttonStyle(.plain)
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 10, trailing: 16))
        }
    }
}

#Preview {
    HelpAndContact()
}
