//
//  MeetupAPI.swift
//  CocoaHeadsApp
//
//  Created by Bruno Bilescky on 06/11/15.
//  Copyright © 2015 CocoaHeads Brasil. All rights reserved.
//

import Moya

/**
API provider. Will do the hard work
*/
let MeetupAPIProvider = MoyaProvider<MeetupAPI>()

/**
Wrapper for a provider. Provides parsed results
*/
let MeetupAPIConsumer = APIConsumer(MeetupAPIProvider)

/**
 Define all endpoints here
*/
public enum MeetupAPI {
    case None
    case ListEvents(perPage :Int, pageOffset :Int)
}

extension MeetupAPI :MoyaTarget {

    /**
     API base url
     */
    public var baseURL: NSURL { return NSURL(string:"https://api.meetup.com/2")! }
   
    /**
     Path for each endpoint
     */
    public var path: String {
        switch self {
        case .ListEvents:
            return "/events"
        default:
            return "/"
        }
    }
    
    /**
     HTTP method for each endpoint
     */
    public var method: Moya.Method {
        switch self {
        default:
            return .GET
        }
    }
    
    /**
     Parameters for each endpoint
     */
    public var parameters: [String: AnyObject]? {
        var params = ["sign":"true","photo-host":"public"]
        switch self {
        case .ListEvents(let perPage, let offset):
            params["page"] = "\(perPage)"
            params["offset"] = "\(offset)"
            params["fields"] = ["venue", "headcount", "photo_url"].joinWithSeparator(",")
            params["group_urlname"] = "AppsterdamBR"
        default:
            break
        }
        return params
    }
    
    /**
     Sample data for each endpoint. Useful for tests
     */
    public var sampleData: NSData {
        do {
            switch self {
            default:
                let data  = try NSJSONSerialization.dataWithJSONObject(["":""], options: NSJSONWritingOptions.PrettyPrinted)
                return data
            }
        }
        catch {
            return NSData()
        }
    }
}

