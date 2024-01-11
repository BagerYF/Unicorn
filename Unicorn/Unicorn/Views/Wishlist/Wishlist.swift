//
//  Wishlist.swift
//  Unicorn
//
//  Created by Bager on 2023/12/13.
//

import SwiftUI
import Kingfisher

struct Wishlist: View {

    @State private var path = NavigationPath()

    @EnvironmentObject var vm: WishlistVM

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    var body: some View {
        NavigationStack(path: $path) {
            content
                .navigationTitle("Wishlist")
                .navigationBarTitleDisplayMode(.inline)
                .modifier(SetNavCartButton(path: $path))
                .navigationDestination(for: RouterModel.self) { route in
                    route.destination.view($path, params: route.params)
                }
        }
    }

    var content: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(0..<vm.wishlist.count, id: \.self) { index in
                        let item = vm.wishlist[index]
                        VStack(spacing: 0) {
                            HStack {
                                Spacer()
                                Image("wishlist_colse")
                                    .onTapGesture {
                                        vm.removeWishlist(id: item.sid)
                                    }
                            }
                            .padding(.vertical, 10)
                            KFImage(URL(string: item.image.count > 0 ? item.image : AppConstants.ImagePlaceHolder))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 200)
                                .background(.white)
                            Text(item.title)
                                .lineLimit(1)
                                .modifier(TextBlackBold16())
                                .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
                            Text(item.vendor)
                                .lineLimit(2)
                                .multilineTextAlignment(.center)
                                .modifier(TextBlack14())
                                .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                            Text("$ \(item.price)")
                                .modifier(TextBlack14())
                                .padding(EdgeInsets(top: 16, leading: 0, bottom: 10, trailing: 0))
                        }
                        .padding(.horizontal, 10)
                        .onTapGesture {
                            path.append(RouterModel(destination: .productDetail, params: ["id": vm.wishlist[index].sid]))
                        }
                }
            }
            .padding(.horizontal, 10)
        }
        .enableRefresh()
        .overlay(Group {
            if vm.wishlist.count == 0 {
                Text("Your wishlist is currently empty")
                    .modifier(TextBlack16())
            } else {
                EmptyView()
            }
        })
    }
}

#Preview {
    Wishlist()
}
