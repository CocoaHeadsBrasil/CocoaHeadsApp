//
//  Unbox+Extensions.swift
//  CocoaHeadsApp
//
//  Created by Bruno Bilescky on 06/11/15.
//  Copyright © 2015 CocoaHeads Brasil. All rights reserved.
//

import UIKit
import Unbox

public class UnboxNSDateTransformer: UnboxTransformer {
    public typealias RawType = String
    public typealias TransformedType = NSDate
    
    public static func transformUnboxedValue(unboxedValue: RawType) -> TransformedType? {
        let tempo = Tempo(stringDate: unboxedValue)
        return tempo.date
    }
    
    public static func fallbackValue() -> TransformedType {
        return NSDate()
    }
}

extension NSDate: UnboxableByTransform {
    public typealias UnboxTransformerType = UnboxNSDateTransformer
}