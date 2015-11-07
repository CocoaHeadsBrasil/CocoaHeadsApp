//
//  ObjectParser.swift
//  CocoaHeadsApp
//
//  Created by Bruno Bilescky on 06/11/15.
//  Copyright © 2015 CocoaHeads Brasil. All rights reserved.
//

import UIKit
import Unbox

enum ParseErrors :ErrorType {
    case BadResponse
    case MissingParameters
    case ParseFailed
    case BadResponseCode(Int)
}

/**
 The Object Parse will try to parse a JSON to a model using the Unbox framework
*/
public class ObjectParser<T: Unboxable>: NSObject {
    
    let jsonData :NSData
    
    required public init(jsonData data:NSData) {
        jsonData = data
        super.init()
    }
    
    public func parsedResponse() -> (response :T?, error :ErrorType?) {
        do {
            let object :T = try UnboxOrThrow(jsonData)
            return (object, error: nil)
        }
        catch (let error) {
            return (nil, error: error)
        }
    }
    
}