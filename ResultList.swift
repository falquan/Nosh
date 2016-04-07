//
//  ResultList.swift
//  Nosh
//
//  Created by Falquan on 4/7/16.
//  Copyright © 2016 Falquan. All rights reserved.
//

import Foundation

class ResultList {
    var query : String?
    var start : Int?
    var end : Int?
    var total : Int?
    var sort : SortBy?
    var foodGroupFilter : String?
    var standardReleaseVersion : String?
    var items : [ResultItem]?
}