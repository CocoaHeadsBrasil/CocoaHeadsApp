//
//  ModelTestUtils.swift
//  CocoaHeadsApp
//
//  Created by Gustavo Barbosa on 2/22/16.
//  Copyright © 2016 CocoaHeads Brasil. All rights reserved.
//

import Foundation
import XCTest

extension XCTestCase {
    
    func jsonObjectWithName(jsonName: String) -> NSDictionary {
        let bundle = NSBundle(forClass: EventTest.self)
        guard let path = bundle.pathForResource(jsonName, ofType: "json") else { return [:] }
        
        do {
            let data = try NSData(contentsOfURL: NSURL(fileURLWithPath: path), options: .DataReadingMappedIfSafe)
            let dict = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers) as? NSDictionary
            return dict!
        } catch {
            return [:]
        }
    }
}