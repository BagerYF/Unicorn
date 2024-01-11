    //
    //  AppEnum.swift
    //  shopifytestios
    //
    //  Created by Bager on 2023/3/20.
    //

import UIKit

enum NavLeftType{
    case None, Back, Close
}

enum InputType{
    case Single, DoubleLeft, DoubleRight
}

enum HomeSectionType: String {
    case FirstSection = "FirstSection"
    case NewArrivalSection = "NewArrivalSection"
    case NewSeasonSection = "NewSeasonSection"
    case ContemporarySection = "ContemporarySection"
    case PrimarySection = "PrimarySection"
    case PopularSection = "PopularSection"
}

enum CheckoutPage: Int {
    case Address = 0, Delivery, Payment
}
