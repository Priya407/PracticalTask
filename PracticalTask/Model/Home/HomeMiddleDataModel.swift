//
//  HomeMiddleDataModel.swift
//  PracticalTask
//
//  Created by Vinit Agrawal on 15/04/25.
//

import Foundation
import ObjectMapper

struct HomeMiddleDataModel : Mappable {
    var shop_by_category : [Shop_by_category]?
    var shop_by_fabric : [Shop_by_fabric]?
    var unstitched : [Unstitched]?
    var boutique_collection : [Boutique_collection]?
    var status : String?
    var message : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        shop_by_category <- map["shop_by_category"]
        shop_by_fabric <- map["shop_by_fabric"]
        unstitched <- map["Unstitched"]
        boutique_collection <- map["boutique_collection"]
        status <- map["status"]
        message <- map["message"]
    }

}
struct Shop_by_category : Mappable {
    var category_id : String?
    var name : String?
    var tint_color : String?
    var image : String?
    var sort_order : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        category_id <- map["category_id"]
        name <- map["name"]
        tint_color <- map["tint_color"]
        image <- map["image"]
        sort_order <- map["sort_order"]
    }

}
struct Shop_by_fabric : Mappable {
    var fabric_id : String?
    var name : String?
    var tint_color : String?
    var image : String?
    var sort_order : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        fabric_id <- map["fabric_id"]
        name <- map["name"]
        tint_color <- map["tint_color"]
        image <- map["image"]
        sort_order <- map["sort_order"]
    }

}
struct Unstitched : Mappable {
    var range_id : String?
    var name : String?
    var description : String?
    var image : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        range_id <- map["range_id"]
        name <- map["name"]
        description <- map["description"]
        image <- map["image"]
    }

}
struct Boutique_collection : Mappable {
    var banner_image : String?
    var name : String?
    var cta : String?
    var banner_id : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        banner_image <- map["banner_image"]
        name <- map["name"]
        cta <- map["cta"]
        banner_id <- map["banner_id"]
    }
    
}
