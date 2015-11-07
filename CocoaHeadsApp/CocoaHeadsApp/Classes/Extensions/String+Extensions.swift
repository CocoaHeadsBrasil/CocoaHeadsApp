//
//  String+Extensions.swift
//  CocoaHeadsApp
//
//  Created by Bruno Bilescky on 06/11/15.
//  Copyright © 2015 CocoaHeads Brasil. All rights reserved.
//

import UIKit

extension String {

    init?(data : NSData?, encoding : NSStringEncoding)
    {
        guard let data = data else {
            self.init()
            return
        }
        self.init(bytes: UnsafeBufferPointer(start: UnsafePointer<UInt8>(data.bytes), count: data.length), encoding: encoding)
    }
    
    var URLEscapedString: String {
        return self.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())!
    }
    
}
