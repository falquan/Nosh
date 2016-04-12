//
//  SearchOptions.swift
//  Nosh
//
//  Created by Falquan on 4/7/16.
//  Copyright © 2016 Falquan. All rights reserved.
//

import Foundation

class SearchOptions {
    init() {
        
    }
    
    init(query: String) {
        self.query = query
    }

    var query : String = ""
    var max : Int = 25
}