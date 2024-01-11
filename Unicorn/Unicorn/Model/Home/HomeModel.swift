    //
    //  Home.swift
    //  Unicorn
    //
    //  Created by Bager on 2023/12/29.
    //

import SwiftUI

struct HomeModel : Identifiable {

    let id = UUID()
    var enabled : Bool!
    var items : [HomeItem]!
    var link : String!
    var name : String!
    var subTitle : String!
    var title : String!

    init(fromDictionary dictionary: [String:Any]){
        enabled = dictionary["enabled"] as? Bool
        items = [HomeItem]()
        if let itemsArray = dictionary["items"] as? [[String:Any]]{
            for dic in itemsArray{
                let value = HomeItem(fromDictionary: dic)
                items.append(value)
            }
        }
        link = dictionary["link"] as? String
        name = dictionary["name"] as? String
        subTitle = dictionary["subTitle"] as? String
        title = dictionary["title"] as? String
    }

}


struct HomeItem : Identifiable {

    let id = UUID()
    var absoluteImageUrl : String!
    var absoluteMobileImageUrl : String!
    var brand : String!
    var image : String!
    var mobileImage : String!
    var productName : String!
    var text : String!
    var url : String!

    init(fromDictionary dictionary: [String:Any]){
        absoluteImageUrl = dictionary["absoluteImageUrl"] as? String
        absoluteMobileImageUrl = dictionary["absoluteMobileImageUrl"] as? String
        brand = dictionary["brand"] as? String
        image = dictionary["image"] as? String
        mobileImage = dictionary["mobileImage"] as? String
        productName = dictionary["productName"] as? String
        text = dictionary["text"] as? String
        url = dictionary["url"] as? String
    }
}


let kHomeMaps =  [
    [
        "name": "FirstSection",
        "title": "",
        "subTitle": "",
        "items": [
            [
                "text":
                    "Explore our range of world-class designer brands selling at up to 80% off",
                "absoluteMobileImageUrl":
                    "https://hbimg.b0.upaiyun.com/d5ffcc83ca2ef6f5878009a33e8f686a47ca28582cc78-WSFdfB_fw658",
            ],
            [
                "text": "Discover over 100 new arrivals",
            ],
            [
                "text": "Feature: Jimmy Choo",
            ]
        ]
    ],
    [
        "name": "PopularSection",
        "title": "",
        "subTitle": "",
        "items": [
            [
                "brand": "Women's Collection",
                "productName":
                    "Shop our women's collection featuring over 500 designers"
            ],
            [
                "brand": "Spotlight on Elisabetta Franchi",
                "productName":
                    "Discover the refined and stylish women's collection of Italian fashion house Elisabetta Franchi"
            ]
        ]
    ],
    [
        "name": "NewSeasonSection",
        "title": "New Season Fashion",
        "subTitle":
            "Transform your look this season with products from these iconic brands",
        "items": [
            [
                "text": "Saint Laurent",
            ],
            [
                "text": "Marine Serre",
            ],
            [
                "text": "Prada",
            ],
            [
                "text": "Alexander McQueen",
            ]
        ]
    ],
    [
        "name": "ContemporarySection",
        "title": "Sneaker Obsessed",
        "subTitle":
            "Satisfy your sneaker obsession with our diverse range of new season styles",
        "items": [
            [
                "text": "Valentino",
            ],
            [
                "text": "Saint Laurent",
            ],
            [
                "text": "Bottega Veneta",
            ],
            [
                "text": "Dolce & Gabbana",
            ]
        ]
    ],
    [
        "name": "NewArrivalSection",
        "title": "New Arrivals",
        "subTitle":
            "Stay up-to-date with the latest styles from our extensive range of designers",
        "items": [
            [
                "text": "Shop Clothing",
            ],
            [
                "text": "Shop Shoes",
            ],
            [
                "text": "Shop Bags",
            ],
            [
                "text": "Shop Accessories",
            ]
        ]
    ],
    [
        "name": "PrimarySection",
        "title": "Neues von Fendi",
        "subTitle": "Entdecken Sie einen der gefragtesten Designer der Welt",
        "items": [
            [
                "brand": "Neues von Fendi",
                "productName":
                    "Entdecken Sie eine der gefragtesten Designermarken der Welt"
            ],
            [
                "brand": "Neue Saison-Taschen",
                "productName": "Shoppen Sie unsere umfangreiche Auswahl an Taschen"
            ]
        ]
    ]
];

