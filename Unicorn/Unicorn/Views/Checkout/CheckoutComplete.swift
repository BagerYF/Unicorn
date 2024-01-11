//
//  CheckoutComplete.swift
//  Unicorn
//
//  Created by Bager on 2024/1/8.
//

import SwiftUI

struct CheckoutComplete: View {

    @Binding var path: NavigationPath

    @State var email: String = ""

    var body: some View {
        content
            .navigationTitle("Order Complete")
            .modifier(SetNavBackButton(imageStr: "none"))
            .navigationBarTitleDisplayMode(.inline)
    }

    var content: some View {
        VStack(spacing: 10) {
            VStack(spacing: 10) {
                Image("success")
                Text("Your order is complete")
                    .modifier(TextBlack16())
                    .fontWeight(.bold)
                    .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                Text("A confirmation email will be sent to \n \(email)")
                    .modifier(TextGrey9E9E9E14())
                    .multilineTextAlignment(.center)
            }
            .frame(maxHeight: .infinity)
            Button {
                path = NavigationPath()
                UserDefaults.standard.setValue(0, forKey: "appTabIndex")
            } label: {
                Text("Continue Shopping")
                    .font(.system(size: 16))
                    .frame(height: 40)
                    .frame(maxWidth: .infinity)
                    .background(.black)
                    .foregroundColor(.white)
                    .cornerRadius(2)
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 16)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .onAppear() {
            
        }
    }
}
