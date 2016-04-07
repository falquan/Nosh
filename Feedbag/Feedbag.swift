//
//  Feedbag.swift
//  Nosh
//
//  Created by Falquan on 4/4/16.
//  Copyright © 2016 Falquan. All rights reserved.
//

import Foundation

class Feedbag {
    let apiKey : String
    
    init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    func send(searchOptions: SearchOptions) -> SearchResult {
        let result = SearchResult()
        
        // TODO: send to service
        print("sending....")

        return result
    }
}