import Foundation
import XCTest

extension XCTestCase {
    
    func jsonObjectWithName(jsonName: String) -> [String:AnyObject] {
        let bundle = NSBundle(forClass: EventTest.self)
        guard let path = bundle.pathForResource(jsonName, ofType: "json") else { return [:] }
        
        do {
            let data = try NSData(contentsOfURL: NSURL(fileURLWithPath: path), options: .DataReadingMappedIfSafe)
            let dict = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers) as? [String:AnyObject]
            return dict!
        } catch {
            return [:]
        }
    }
}
