//
//  HomeModel.swift
//  PracticalTask
//
//  Created by Vinit Agrawal on 15/04/25.
//

import Foundation
import ObjectMapper

struct HomeUpperDataModel : Mappable {
    var main_sticky_menu : [Main_sticky_menu]?
    var status : String?
    var message : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        main_sticky_menu <- map["main_sticky_menu"]
        status <- map["status"]
        message <- map["message"]
    }

}

struct Main_sticky_menu : Mappable {
    var title : String?
    var image : String?
    var sort_order : String?
    var slider_images : [Slider_images]?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        title <- map["title"]
        image <- map["image"]
        sort_order <- map["sort_order"]
        slider_images <- map["slider_images"]
    }

}
struct Slider_images : Mappable {
    var title : String?
    var image : String?
    var sort_order : String?
    var cta : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        title <- map["title"]
        image <- map["image"]
        sort_order <- map["sort_order"]
        cta <- map["cta"]
    }

}
