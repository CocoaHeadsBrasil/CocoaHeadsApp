//
//  String+Extensions.swift
//  CocoaHeadsApp
//
//  Created by Bruno Bilescky on 06/11/15.
//  Copyright © 2015 CocoaHeads Brasil. All rights reserved.
//

import UIKit

extension String {

    /**
     Allows to create a string representation of a NSData
     - parameter data: Data that will be converted to String
     - parameter encoding: Encoding used to parse the data
     */
    init?(data : NSData?, encoding : NSStringEncoding = NSUTF8StringEncoding) {
        guard let data = data else {
            self.init()
            return
        }
        self.init(bytes: UnsafeBufferPointer(start: UnsafePointer<UInt8>(data.bytes), count: data.length), encoding: encoding)
    }
    
    /**
     Escapes the current string, making it safe to use to create an url
     */
    var URLEscapedString: String {
        return self.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet()) ?? ""
    }
    
}
