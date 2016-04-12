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

    let nutritionService : NutritionService
    
    init(config: FeedbagConfiguration) {
        self.config = config

//        TODO: configure these with IoC container
//        switch self.config.serviceConfiguration.serviceId {
//            case "SomeSearchService":
//                self.searchService = SomeSearchService(config: config.serviceConfiguration)
//            default:
//                throw ConfigurationError.MissingServiceId
//        }

        self.nutritionService = USDANDB(config: config.serviceConfiguration)
    }
    
    func search(searchOptions: SearchOptions) {
        self.nutritionService.search(searchOptions)
    }
}