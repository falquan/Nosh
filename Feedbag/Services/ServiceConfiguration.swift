//
//  ServiceConfiguration.swift
//  Nosh
//
//  Created by Falquan on 4/11/16.
//  Copyright © 2016 Falquan. All rights reserved.
//

import Foundation

class ServiceConfiguration {
    let serviceId : String
    var apiKey : String? = nil

    init(serviceId: String) {
        self.serviceId = serviceId
    }
    
    init(serviceId: String, apiKey: String) {
        self.serviceId = serviceId
        self.apiKey = apiKey
    }
}