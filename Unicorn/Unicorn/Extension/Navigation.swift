    //
    //  Navigation.swift
    //  Unicorn
    //
    //  Created by Bager on 2023/12/22.
    //

import SwiftUI

extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}

struct SetNavBackButton: ViewModifier {

    var imageStr = "backarrow"

    @Environment(\.dismiss) private var dismiss

    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    if imageStr == "none" {
                        EmptyView()
                    } else {
                        Button {
                            dismiss()
                        } label: {
                            HStack {
                                Image(imageStr)
                            }
                            .padding(.horizontal, 10)
                        }
                    }
                }
            }
    }
}

extension View {
    func navBackButton() -> some View {
        modifier(SetNavBackButton())
    }
}

struct SetNavCartButton: ViewModifier {

    @Binding var path: NavigationPath

    @EnvironmentObject var cartVM: CartVM

    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        path.append(RouterModel(destination: .cart))
                    } label: {
                        HStack {
                            ZStack {
                                Image("nav_bag")
                                if cartVM.getCartQty().count > 0 {
                                    VStack {
                                        Text(cartVM.getCartQty())
                                            .modifier(TextBlack12())
                                    }
                                    .frame(height: 14)
                                    .background(.white)
                                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
                                }
                            }
                        }
                        .padding(.horizontal, 10)
                    }
                }
            }
    }
}
