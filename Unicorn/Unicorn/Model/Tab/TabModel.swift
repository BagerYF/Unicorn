    //
    //  TabModel.swift
    //  Unicorn
    //
    //  Created by Bager on 2023/12/13.
    //

import SwiftUI
import Foundation
import HandyJSON

struct TabModel: Identifiable, HandyJSON {
    init() {

    }

    var id = UUID()
    var image : String!
    var index : Int!
    var selectImage : String!
    var title : String!
    var view : AnyView!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        image = dictionary["image"] as? String
        index = dictionary["index"] as? Int
        selectImage = dictionary["selectImage"] as? String
        title = dictionary["title"] as? String
        view = dictionary["view"] as? AnyView
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if image != nil{
            dictionary["image"] = image
        }
        if index != nil{
            dictionary["index"] = index
        }
        if selectImage != nil{
            dictionary["selectImage"] = selectImage
        }
        if title != nil{
            dictionary["title"] = title
        }
        return dictionary
    }

}
