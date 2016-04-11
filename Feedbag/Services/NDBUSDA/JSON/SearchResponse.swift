//
//  SearchResponse.swift
//  Nosh
//
//  Created by Falquan on 4/7/16.
//  Copyright © 2016 Falquan. All rights reserved.
//

import Foundation
import ObjectMapper

class SearchResponse : Mappable {
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        list <- map["list"]
    }
    
    var list : SearchResponseList?
}