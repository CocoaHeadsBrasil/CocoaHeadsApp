//
//  Unbox+Extensions.swift
//  CocoaHeadsApp
//
//  Created by Bruno Bilescky on 06/11/15.
//  Copyright © 2015 CocoaHeads Brasil. All rights reserved.
//

import UIKit
import Unbox

/**
 Allow NSDate fields inside Unboxable models
*/
public class UnboxNSDateTransformer: UnboxTransformer {
<<<<<<< HEAD
    public typealias RawType = String
    public typealias TransformedType = NSDate
    
    public static func transformUnboxedValue(unboxedValue: RawType) -> TransformedType? {
        let tempo = Tempo(stringDate: unboxedValue)
=======
    public typealias RawType = Double
    public typealias TransformedType = NSDate
    
    public static func transformUnboxedValue(unboxedValue: RawType) -> TransformedType? {
        let seconds = unboxedValue / 1000
        let tempo = Tempo(unixOffset: seconds)
>>>>>>> master
        return tempo.date
    }
    
    public static func fallbackValue() -> TransformedType {
        return NSDate()
    }
}

extension NSDate: UnboxableByTransform {
    public typealias UnboxTransformerType = UnboxNSDateTransformer
}