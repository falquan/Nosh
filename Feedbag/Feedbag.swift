//
//  Feedbag.swift
//  Nosh
//
//  Created by Falquan on 4/4/16.
//  Copyright © 2016 Falquan. All rights reserved.
//

import Foundation
import ObjectMapper

enum JSONError: String, ErrorType {
    case NoData = "ERROR: no data"
    case ConversionFailed = "ERROR: conversion from JSON failed"
}

class Feedbag {
    let apiKey : String
    
    init(apiKey: String) {
        self.apiKey = apiKey
    }
    
    func search(searchOptions: SearchOptions) {
        let url = NSURLComponents()
        url.scheme = "https"
        url.host = "api.nal.usda.gov"
        url.path = "/ndb/search/"
        url.query = "format=\(ResultFormat.JSON.rawValue)&q=\(searchOptions.query)&sort=\(searchOptions.sortBy.rawValue)&max=\(searchOptions.max)&offset=\(searchOptions.offset)&api_key=\(self.apiKey)"
        
        NSURLSession.sharedSession().dataTaskWithURL(url.URL!) {
            (data, response, error) -> Void in

            if let httpResponse = response as? NSHTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    do {
                        let json = try self.validateSearchResponse(data, response: response, error: error)
                        
                        let result = Mapper<SearchResponse>().map(json)
                    } catch {
                        print("FAIL!")
                    }
                }
            }
        }.resume()
    }
    
    func validateSearchResponse(data: NSData?, response: NSURLResponse?, error: NSError?) throws -> NSDictionary {
        guard let data = data else {
            throw JSONError.NoData
        }

        guard let json = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? NSDictionary else {
            throw JSONError.ConversionFailed
        }
        
        return json;
    }
}