import UIKit
import Unbox

/**
 Allow NSDate fields inside Unboxable models
*/
public class UnboxNSDateTransformer: UnboxTransformer {
    public typealias RawType = Double
    public typealias TransformedType = NSDate
    
    public static func transformUnboxedValue(unboxedValue: RawType) -> TransformedType? {
        let seconds = unboxedValue / 1000
        let tempo = Tempo(unixOffset: seconds)
        return tempo.date
    }
    
    public static func fallbackValue() -> TransformedType {
        return NSDate()
    }
}

extension NSDate: UnboxableByTransform {
    public typealias UnboxTransformerType = UnboxNSDateTransformer
}