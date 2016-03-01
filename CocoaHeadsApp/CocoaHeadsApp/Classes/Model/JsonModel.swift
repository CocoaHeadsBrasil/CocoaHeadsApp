import Foundation

protocol JSONParselable {
    static func withJSON(json: [String:AnyObject]) -> Self?
}

extension JSONParselable {
    static func number(input: [NSObject:AnyObject], key: String) -> NSNumber? {
        return input[key] >>>= { $0 as? NSNumber }
    }
    
    static func int(input: [NSObject:AnyObject], key: String) -> Int? {
        return number(input, key: key).map { $0.integerValue }
    }
    
    static func float(input: [NSObject:AnyObject], key: String) -> Float? {
        return number(input, key: key).map { $0.floatValue }
    }
    
    static func double(input: [NSObject:AnyObject], key: String) -> Double? {
        return number(input, key: key).map { $0.doubleValue }
    }
    
    static func string(input: [String:AnyObject], key: String) -> String? {
        return input[key] >>>= { $0 as? String }
    }
    
    static func bool(input: [String:AnyObject], key: String) -> Bool? {
        return number(input, key: key).map { $0.boolValue }
    }
    
    static func nsdate(input: [String:AnyObject], key: String) -> NSDate? {
        guard let dateString = string(input, key: key) else { return nil }
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        return formatter.dateFromString(dateString)
    }
    
    static func url(input: [String:AnyObject], key: String) -> NSURL? {
        guard let url = string(input, key: key) else { return nil }
        return NSURL(string: url)
    }
}

func flatten<A>(x: A??) -> A? {
    if let y = x { return y }
    return nil
}

infix operator >>>= {}
func >>>= <A, B> (optional: A?, f: A -> B?) -> B? {
    return flatten(optional.map(f))
}
