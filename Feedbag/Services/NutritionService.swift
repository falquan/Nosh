//
//  File.swift
//  Nosh
//
//  Created by Falquan on 4/11/16.
//  Copyright © 2016 Falquan. All rights reserved.
//

import Foundation

protocol NutritionService {
    init(config: ServiceConfiguration)
    
    func search(searchOptions: SearchOptions)
    func searchValidateResponse(response: NSURLResponse?, error: NSError?) throws
    func searchParseResponse(data: NSData?) throws -> NSDictionary
    func searchNotifySuccess(result: SearchResult?)
    func searchNotifyError(error: NSError?)
}