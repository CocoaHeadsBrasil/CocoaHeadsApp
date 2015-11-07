//
//  APIConsumer.swift
//  CocoaHeadsApp
//
//  Created by Bruno Bilescky on 06/11/15.
//  Copyright © 2015 CocoaHeads Brasil. All rights reserved.
//

import UIKit
import Moya
import Unbox

enum APIErrors :ErrorType {
    case BadAPIResponse(Int?,String?)
    case UndefinedBehavior(NSData)
}

class APIConsumer<Target:MoyaTarget>: NSObject {
    
    let provider :MoyaProvider<Target>
    
    init(_ aProvider :MoyaProvider<Target>) {
        provider = aProvider
        super.init()
    }
    
    func consume<T :Unboxable>(target :Target, success:(T -> Void) = { _ in }, failure:(ErrorType -> Void) = { error in logger.error("\(error)") }) -> Cancellable {
        func handleRequestResponse(data: NSData?, statusCode: Int?, response: NSURLResponse?, error: ErrorType?) {
            if let retError = error {
                return failure(retError)
            }
            guard let data = data else {
                return failure(APIErrors.BadAPIResponse(statusCode, "No Response"))
            }
            guard statusCode == 200 else {
                return failure(APIErrors.BadAPIResponse(statusCode, String(data: data, encoding: NSUTF8StringEncoding)))
            }
            let parser = ObjectParser<T>(jsonData: data)
            let parsedResponse = parser.parsedResponse()
            if let validResponse = parsedResponse.response {
                success(validResponse)
            }
            else if let error = parsedResponse.error {
                failure(error)
            }
            else {
                failure(APIErrors.UndefinedBehavior(data))
            }
        }
        let cancellable = provider.request(target, completion:handleRequestResponse)
        return cancellable
    }
    
}