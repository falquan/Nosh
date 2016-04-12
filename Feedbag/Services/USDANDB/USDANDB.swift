//
//  USDANDB.swift
//  Nosh
//
//  Created by Falquan on 4/11/16.
//  Copyright © 2016 Falquan. All rights reserved.
//

import Foundation
import ObjectMapper

class USDANDB : SearchService {
    let apiKey : String

    required init(config: ServiceConfiguration) {
        self.apiKey = config.apiKey!
    }
    
    func search(searchOptions: SearchOptions) {
        let url = NSURLComponents()
        url.scheme = "https"
        url.host = "api.nal.usda.gov"
        url.path = "/ndb/search/"
        url.query =
            "format=\(ResultFormat.JSON.rawValue)&" +
            "q=\(searchOptions.query)&" +
            "sort=\(searchOptions.sortBy.rawValue)&" +
            "max=\(searchOptions.max)&" +
            "offset=\(searchOptions.offset)&" +
            "api_key=\(self.apiKey)"
        
        NSURLSession.sharedSession().dataTaskWithURL(url.URL!) {
            (data, response, error) -> Void in
            
            if let response = response as? NSHTTPURLResponse {
                if response.statusCode == HTTPStatusCode.OK.rawValue {
                    do {
                        let json = try self.searchValidateResponse(data, response: response, error: error)
                        let result = Mapper<SearchResponse>().map(json)!
                        self.searchNotifySuccess(result)
                        return
                    } catch {
                        print("invalid JSON")
                    }
                }
            }
            
            self.searchNotifyError(error!)
        }.resume()
    }
    
    func searchValidateResponse(data: NSData?, response: NSURLResponse?, error: NSError?) throws -> NSDictionary {
        guard let data = data else {
            throw ConversionError.NoData
        }
        
        guard let json = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? NSDictionary else {
            throw ConversionError.ConversionFailed
        }
        
        return json;
    }
    
    func searchNotifySuccess(response: SearchResponse) -> SearchResult {
        var items = [SearchItem]()
        for responseItem: SearchResponseItem in (response.list?.items)! {
            let resultItem = SearchItem()
            resultItem.id = responseItem.ndbNumber
            resultItem.name = responseItem.name
            items.append(resultItem)
        }
        
        let searchResult = SearchResult()
        searchResult.items = items
        searchResult.query = response.list?.query
        searchResult.total = response.list?.total
        
        return searchResult
    }
    
    func searchNotifyError(error: NSError) {
        print("error occured: \(error)")
    }
}