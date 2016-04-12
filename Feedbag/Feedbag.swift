//
//  Feedbag.swift
//  Nosh
//
//  Created by Falquan on 4/4/16.
//  Copyright © 2016 Falquan. All rights reserved.
//

import Foundation

class Feedbag {
    let config : FeedbagConfiguration

//  TODO: configure these with IoC container
    let searchService : SearchService
    
    init(config: FeedbagConfiguration) {
        self.config = config

//        TODO: configure these with IoC container
//        switch self.config.serviceConfiguration.serviceId {
//            case "SomeSearchService":
//                self.searchService = SomeSearchService(config: config.serviceConfiguration)
//            default:
//                throw ConfigurationError.MissingServiceId
//        }

        self.searchService = USDANDB(config: config.serviceConfiguration)
    }
    
    func search(searchOptions: SearchOptions) {
        self.searchService.search(searchOptions)
    }
}