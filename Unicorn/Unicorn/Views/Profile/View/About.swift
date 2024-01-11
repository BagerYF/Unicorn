    //
    //  About.swift
    //  Unicorn
    //
    //  Created by Bager on 2023/12/29.
    //

import SwiftUI

struct About: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("The Best of Luxury Fashion")
                    .modifier(TextBlack20())
                    .padding(.vertical, 20)
                Image("about")
                    .resizable()
                Text("""
                     Shopify brings to you the best of luxury fashion. Featuring an extensive range of over 500 brands, including womenswear, menswear and kidswear from iconic fashion houses, such as Prada, Gucci, Saint Laurent, Balenciaga and Valentino.

                     Every aspect of the user experience is optimized, starting with a curated selection of world-renowned brands delivered with best-in-class technology. Payment is easy and secure, with free express shipping to over X countries and free returns on all orders so you can shop with confidence.
                     """
                )
                .modifier(TextBlack16())
                .lineSpacing(7)
                .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 36))
            }
        }
        .navigationTitle("About")
        .navigationBarTitleDisplayMode(.inline)
        .navBackButton()
        .toolbar(.hidden, for: .tabBar)

    }
}

#Preview {
    About()
}
