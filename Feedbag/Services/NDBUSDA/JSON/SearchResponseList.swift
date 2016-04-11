//
//  ResultList.swift
//  Nosh
//
//  Created by Falquan on 4/7/16.
//  Copyright © 2016 Falquan. All rights reserved.
//

import Foundation
import ObjectMapper

class SearchResponseList : Mappable {
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        query <- map["q"]
        start <- map["start"]
        end <- map["end"]
        total <- map["total"]
        sort <- map["sort"]
        foodGroupFilter <- map["fg"]
        standardReleaseVersion <- map["sr"]
        items <- map["item"]
    }
    
    var query : String?
    var start : Int?
    var end : Int?
    var total : Int?
    var sort : SortBy?
    var foodGroupFilter : String?
    var standardReleaseVersion : String?
    var items : [SearchResponseItem]?
}