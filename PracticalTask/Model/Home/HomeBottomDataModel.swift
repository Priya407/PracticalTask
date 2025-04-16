//
//  HomeBottomDataModel.swift
//  PracticalTask
//
//  Created by Vinit Agrawal on 15/04/25.
//

import Foundation
import ObjectMapper

struct HomeBottomDataModel : Mappable {
    var range_of_pattern : [Range_of_pattern]?
    var design_occasion : [Design_occasion]?
    var status : String?
    var message : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        range_of_pattern <- map["range_of_pattern"]
        design_occasion <- map["design_occasion"]
        status <- map["status"]
        message <- map["message"]
    }

}
struct Range_of_pattern : Mappable {
    var product_id : String?
    var image : String?
    var name : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        product_id <- map["product_id"]
        image <- map["image"]
        name <- map["name"]
    }

}

struct Design_occasion : Mappable {
    var product_id : String?
    var name : String?
    var image : String?
    var sub_name : String?
    var cta : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        product_id <- map["product_id"]
        name <- map["name"]
        image <- map["image"]
        sub_name <- map["sub_name"]
        cta <- map["cta"]
    }

}
