//
//  CountryModel.swift
//  Unicorn
//
//  Created by Bager on 2024/1/6.
//

import SwiftUI

class CountryModel: Identifiable {

    let id = UUID()
    var code : String!
    var currencyCode : String!
    var flagPath : String!
    var name : String!
    var provinces : [CountryModel]!
    var firstCharacter : String!
    var isCharacter : Bool!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    required init(fromDictionary dictionary: [String:Any]){
        code = dictionary["code"] as? String
        currencyCode = dictionary["currencyCode"] as? String
        flagPath = dictionary["flagPath"] as? String
        name = dictionary["name"] as? String

        let str = NSMutableString(string: name) as CFMutableString
        CFStringTransform(str, nil, kCFStringTransformToLatin, false)

        CFStringTransform(str, nil, kCFStringTransformStripDiacritics, false)

        var s: String = String(str)
        s = s.capitalized
        firstCharacter = String(s[s.startIndex])

        isCharacter = containsOnlyLetters(input: firstCharacter)

        provinces = [CountryModel]()
        if let provincesArray = dictionary["provinces"] as? [[String:Any]]{
            for dic in provincesArray{
                let value = CountryModel(fromDictionary: dic)
                provinces.append(value)
            }
        }
    }
}
