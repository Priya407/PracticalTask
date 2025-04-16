//
//  CategoryModel.swift
//  PracticalTask
//
//  Created by Vinit Agrawal on 15/04/25.
//

import Foundation
import ObjectMapper

struct CategoryModel : Mappable {
    var categories : [Categories]?
    var banner_image : String?
    var status : String?
    var message : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        categories <- map["categories"]
        banner_image <- map["banner_image"]
        status <- map["status"]
        message <- map["message"]
    }

}
struct Categories : Mappable {
    var category_id : String?
    var category_name : String?
    var parent_id : String?
    var child : [Child]?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        category_id <- map["category_id"]
        category_name <- map["category_name"]
        parent_id <- map["parent_id"]
        child <- map["child"]
    }

}

struct Child : Mappable {
    var category_id : String?
    var category_name : String?
    var parent_id : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        category_id <- map["category_id"]
        category_name <- map["category_name"]
        parent_id <- map["parent_id"]
    }

}
