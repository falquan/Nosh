//
//  ResultItem.swift
//  Nosh
//
//  Created by Falquan on 4/7/16.
//  Copyright © 2016 Falquan. All rights reserved.
//

import Foundation
import ObjectMapper

class SearchResponseItem : Mappable {
    required init?(_ map: Map) {

    }

    func mapping(map: Map) {
        offset <- map["offset"]
        group <- map["group"]
        name <- map["name"]
        ndbNumber <- map["ndbno"]
    }
    
    var offset : Int?
    var group : String?
    var name : String?
    var ndbNumber : IntMax?
}