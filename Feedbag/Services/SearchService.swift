//
//  File.swift
//  Nosh
//
//  Created by Falquan on 4/11/16.
//  Copyright © 2016 Falquan. All rights reserved.
//

import Foundation

protocol SearchService {
    init(config: ServiceConfiguration)
    
    func search(searchOptions: SearchOptions)
    func searchValidateResponse(data: NSData?, response: NSURLResponse?, error: NSError?) throws -> NSDictionary
    func searchNotifySuccess(result: SearchResponse) -> SearchResult
    func searchNotifyError(error: NSError)
}