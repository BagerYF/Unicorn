    //
    //  Router.swift
    //  Unicorn
    //
    //  Created by Bager on 2024/1/10.
    //

import SwiftUI

struct RouterModel: Hashable, Identifiable {
    let id = UUID()
    var destination: AppRouter
    var params: [String: AnyHashable]?
}

enum AppRouter {
    case productList
    case productDetail
    case designerList
    case subCategoryList
    case myOrder
    case saveAddress
    case region
    case notifications
    case about
    case helpAndContact
    case faq
    case returnAndRefund
    case termsAndConditions
    case privacyPolicy
    case checkout
    case checkoutComplete
    case cart
    case def

    @ViewBuilder func view(_ path: Binding<NavigationPath>, params: [String:AnyHashable]?) -> some View{
        switch self{
        case .productList:
            LazyView(ProductList(path: path))
        case .productDetail:
            LazyView(ProductDetail(path: path, id: params!["id"]! as! String))
        case .designerList:
            LazyView(DesignersList(path: path))
        case .subCategoryList:
            LazyView(SubCategoryList(path: path, categoryList: params!["categoryList"]! as! [CategoryModel], subCategoryTitle: params!["subCategoryTitle"]! as! String))
        case .myOrder:
            LazyView(OrderList())
        case .saveAddress:
            LazyView(AddressList())
        case .region:
            LazyView(Region())
        case .notifications:
            LazyView(Notifications())
        case .about:
            LazyView(About())
        case .helpAndContact:
            LazyView(HelpAndContact())
        case .faq:
            LazyView(FAQ())
        case .returnAndRefund:
            LazyView(ReturnAndRefunds())
        case .termsAndConditions:
            LazyView(TermsAndConditions())
        case .privacyPolicy:
            LazyView(PrivacyPolicy())
        case .checkout:
            LazyView(Checkout(path: path))
        case .checkoutComplete:
            LazyView(CheckoutComplete(path: path, email: params!["email"]! as! String))
        case .cart:
            LazyView(Cart(path: path))
        case .def:
            EmptyView()
        }
    }
}
