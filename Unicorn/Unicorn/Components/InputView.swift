//
//  InputView.swift
//  Unicorn
//
//  Created by Bager on 2024/1/6.
//

import SwiftUI
import Kingfisher

struct InputView: View {

    @ObservedObject var item: InputModel

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if item.hideTitle == false {
                HStack {
                    Text("\(item.title)\(item.requireds ? "*" : "")")
                        .modifier(TextBlack12())
                        .padding(.vertical, 10)
                    Spacer()
                    if item.optional {
                        Text("optional")
                            .modifier(TextGrey75757512())
                            .padding(.vertical, 10)
                    }
                }
            }
            HStack {
                if item.leftImg != nil {
                    KFImage(URL(string: item.leftImg ?? ""))
                        .resizable()
                        .frame(width: 24, height: 24)
                }
                TextField(item.placeHolder?.count ?? 0 > 0 ? item.placeHolder! : item.title, text: $item.text)
                    .modifier(TextBlack16())
                    .frame(height: 40)
                    .tint(.black)
                    .onChange(of: item.text) { oldValue, newValue in
                        item.showError = false
                    }
                    .disabled(item.callBack != nil)
                if item.rightImg != nil {
                    Image(item.rightImg ?? "")
                }
            }
            Divider()
            if item.showError {
                Text("Enter a \(item.title)")
                    .modifier(TextRed14())
                    .padding(.vertical, 10)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 10)
        .containerShape(Rectangle())
        .background(.white)
        .onTapGesture {
            if item.callBack != nil {
                item.callBack!()
            }
        }
    }
}
