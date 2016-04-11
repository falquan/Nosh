//
//  SearchRequest.swift
//  Nosh
//
//  Created by Falquan on 4/7/16.
//  Copyright © 2016 Falquan. All rights reserved.
//

import Foundation
import ObjectMapper

class SearchRequest : Mappable {
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        query <- map["q"]
        foodGroupId <- map["fg"]
        sortBy <- map["sort"]
        max <- map["max"]
        offset <- map["offset"]
        format <- map["format"]
    }
    
    var query : String?
    var foodGroupId : String?
    var sortBy : SortBy?
    var max : Int?
    var offset : Int?
    var format : ResultFormat? = ResultFormat.JSON
}