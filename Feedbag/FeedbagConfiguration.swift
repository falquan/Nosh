//
//  FeedbagConfiguration.swift
//  Nosh
//
//  Created by Falquan on 4/11/16.
//  Copyright © 2016 Falquan. All rights reserved.
//

import Foundation

class FeedbagConfiguration {
    init(serviceConfiguration: ServiceConfiguration) {
        self.serviceConfiguration = serviceConfiguration
    }

    init(serviceId: String) {
        serviceConfiguration = ServiceConfiguration(serviceId: serviceId)
    }
    
    init(serviceId: String, apiKey: String) {
        serviceConfiguration = ServiceConfiguration(serviceId: serviceId, apiKey: apiKey)
    }

    let serviceConfiguration : ServiceConfiguration
}