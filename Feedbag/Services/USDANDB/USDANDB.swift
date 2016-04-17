//
//  USDANDB.swift
//  Nosh
//
//  Created by Falquan on 4/11/16.
//  Copyright © 2016 Falquan. All rights reserved.
//

import Foundation
import ObjectMapper

enum HTTPError : String, ErrorType {
    case InvalidResponse = "ERROR: Invalid response"
    case IncorrectStatusCode = "ERROR: Incorrect status code"
    case RequestFailed = "ERROR: Request to service failed"
}

class USDANDB : NutritionService {
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
            "sort=r&" +
            "max=\(searchOptions.max)&" +
            "offset=0&" +
            "api_key=\(self.apiKey)"
        
        NSURLSession.sharedSession().dataTaskWithURL(url.URL!) {
            (data, response, error) -> Void in

            do {
                try self.searchValidateResponse(response, error: error)
                let json = try self.searchParseResponse(data)
                let mappedResponse = Mapper<SearchResponse>().map(json)
                let result = self.convertToSearchResult(mappedResponse!)
                self.searchNotifySuccess(result)
                return
            } catch (HTTPError.RequestFailed) {
                print("request to service failed")
            } catch (HTTPError.IncorrectStatusCode) {
                print("incorrect status code received from service")
            } catch (HTTPError.InvalidResponse) {
                print("invalid response received from service")
            } catch (ConversionError.NoData) {
                print("invalid JSON, no data found")
            } catch (ConversionError.ConversionFailed) {
                print("invalid JSON, conversion failed")
            } catch {
                print("unknown error")
            }
        }.resume()
    }
    
    func searchValidateResponse(response: NSURLResponse?, error: NSError?) throws {
        guard error != nil else {
            throw HTTPError.RequestFailed
        }

        guard let response = response as? NSHTTPURLResponse else {
            // change to real error
            throw HTTPError.InvalidResponse
        }
        
        guard response.statusCode != HTTPStatusCode.OK.rawValue else {
            // change to real error
            throw HTTPError.IncorrectStatusCode
        }
    }
    
    func searchParseResponse(data: NSData?) throws -> NSDictionary {
        guard let data = data else {
            throw ConversionError.NoData
        }
        
        guard let json = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? NSDictionary else {
            throw ConversionError.ConversionFailed
        }
        
        return json;
    }

    func convertToSearchResult(response: SearchResponse) -> SearchResult? {
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
    
    func searchNotifySuccess(result: SearchResult?) {
        // TODO: find a way to provide notification to other objects
        print("success")
    }
    
    func searchNotifyError(error: NSError?) {
        print("error occured: \(error)")
    }
}