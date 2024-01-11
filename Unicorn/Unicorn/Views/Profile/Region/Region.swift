//
//  Region.swift
//  Unicorn
//
//  Created by Bager on 2024/1/5.
//

import SwiftUI
import Kingfisher

struct Region: View {
    var body: some View {
        content
            .navigationTitle("Region")
            .navigationBarTitleDisplayMode(.inline)
            .navBackButton()
            .toolbar(.hidden, for: .tabBar)
    }

    var content: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Select your preferred region.")
                .modifier(TextBlack16())
            Text("Region")
                .modifier(TextBlack12())
            VStack(spacing: 0) {
                HStack {
                    KFImage(URL(string: "https://d1mp1ehq6zpjr9.cloudfront.net/static/images/flags/CN.png"))
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("China, USD $")
                        .modifier(TextBlack16())
                    Spacer()
                    Image("arrow_down")
                }
                .frame(height: 44)
                Divider()
            }
            Spacer()
            Button {

            } label: {
                Text("Update Region")
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
    }
}

#Preview {
    Region()
}
