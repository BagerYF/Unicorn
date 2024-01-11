    //
    //  TabBar.swift
    //  Unicorn
    //
    //  Created by Bager on 2023/12/13.
    //

import SwiftUI
import PopupView

struct TabBar: View {

    @StateObject var cartVM = CartVM()
    @StateObject var loginVM = LoginVM()
    @StateObject var wishlistVM = WishlistVM()

    @AppStorage("appshowloading") var showLoading: Bool = false

    @AppStorage("appTabIndex") var index: Int = 0

    init() {
        UserDefaults.standard.setValue(0, forKey: "appTabIndex")
    }

    var body: some View {
        tabbar
            .overlay(Group {
                if showLoading {
                    Loading()
                } else {
                    EmptyView()
                }
            })
            .environmentObject(cartVM)
            .environmentObject(loginVM)
            .environmentObject(wishlistVM)
    }

    var tabbar: some View {
        TabView(selection: $index) {
            Home()
                .tabItem {
                    Image(index == 0 ? "tab_home_s" : "tab_home")
                    Text("Home")
                }.tag(0)
            Designers()
                .tabItem {
                    Image(index == 1 ? "tab_designers_s" : "tab_designers")
                    Text("Designers")
                }
                .tag(1)
            Search()
                .tabItem {
                    Image(index == 2 ? "tab_search_s" : "tab_search")
                    Text("Search")
                }.tag(2)
            Wishlist()
                .tabItem {
                    Image(index == 3 ? "tab_wishlist_s" : "tab_wishlist")
                    Text("Wishlist")
                }.tag(3)
            Profile()
                .tabItem {
                    Image(index == 4 ? "tab_profile_s" : "tab_profile")
                    Text("Profile")
                }.tag(4)
        }
        .tint(.black)
    }
}

#Preview {
    TabBar()
}

