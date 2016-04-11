//
//  SearchOptions.swift
//  Nosh
//
//  Created by Falquan on 4/7/16.
//  Copyright © 2016 Falquan. All rights reserved.
//

import Foundation

class SearchOptions {
    var query : String = ""
    var foodGroupId : String = ""
    var sortBy : SortBy = SortBy.Relevance
    var max : Int = 25
    var offset : Int = 0
}