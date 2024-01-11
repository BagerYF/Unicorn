    //
    //  SubCategory.swift
    //  Unicorn
    //
    //  Created by Bager on 2024/1/10.
    //

import SwiftUI

struct SubCategoryList: View {

    @Binding var path: NavigationPath

    let categoryList: [CategoryModel]

    var subCategoryTitle: String = ""

    var body: some View {
        content
            .navigationTitle(subCategoryTitle)
            .navigationBarTitleDisplayMode(.inline)
            .navBackButton()
            .toolbar(.hidden, for: .tabBar)
    }

    var content: some View {
        List() {
            ForEach(categoryList, id: \.id) { category in
                VStack(spacing: 0) {
                    HStack {
                        category.name == "Sale" ?
                        AnyView(Text(category.name)
                            .modifier(TextRed16())) :
                        AnyView(Text(category.name)
                            .modifier(TextBlack16()))
                        Spacer()
                        Image("arrow")
                    }
                    .frame(height: 44)
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                    .contentShape(Rectangle())
                    .onTapGesture {
                        path.append(RouterModel(destination: .productList))
                    }
                    Divider()
                }
                .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                .listRowSeparator(.hidden)
            }
        }
        .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
        .background(.white)
        .scrollContentBackground(.hidden)
        .listStyle(.plain)
        .environment(\.defaultMinListRowHeight, 30)

    }
}

