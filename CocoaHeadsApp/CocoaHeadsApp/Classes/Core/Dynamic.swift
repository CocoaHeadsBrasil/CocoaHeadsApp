//
//  Dynamic.swift
//  CocoaHeadsApp
//
//  Created by Bruno Bilescky on 06/11/15.
//  Copyright © 2015 CocoaHeads Brasil. All rights reserved.
//

import UIKit

class Dynamic<ValueType> {
    typealias React = ValueType -> Void
    
    var reactionHandlers :[String:React] = [:]
    
    var value: ValueType {
        didSet {
            self.iterateThroughHandlers()
        }
    }
    
    init(_ v: ValueType) {
        value = v
    }
    
    func iterateThroughHandlers() {
        _ = reactionHandlers.map { _, handler in
            handler(self.value)
        }
    }
    
    func bind(listener :AnyObject, function :React) {
        reactionHandlers["\(listener)"] = function
    }
    
    func bindAndFire(listener :AnyObject, function :React) {
        bind(listener, function: function)
        function(self.value)
    }
    
    func unbind(listener :AnyObject) {
        reactionHandlers.removeValueForKey("\(listener)")
    }
    
    deinit {
        for (key,_) in reactionHandlers {
            reactionHandlers.removeValueForKey("\(key)")
        }
    }
}

protocol Arrayable {
    typealias Element
    mutating func append(el :Element)
    mutating func insert(el :Element, atIndex :Int)
    mutating func removeAtIndex(index :Int) -> Element
    mutating func appendContentsOf(array :Array<Element>)
}

extension Array :Arrayable {
    typealias Element = Array.Generator.Element
}

extension Dynamic where ValueType : Arrayable {
    
    func addElement(el :ValueType.Element) {
        self.value.append(el)
        self.iterateThroughHandlers()
    }
    
    func insertElementAtIndex(el :ValueType.Element, index :Int) {
        self.value.insert(el, atIndex: index)
        self.iterateThroughHandlers()
    }
    
    func removeElementAtIndex(index :Int) -> ValueType.Element? {
        let element = self.value.removeAtIndex(index)
        self.iterateThroughHandlers()
        return element
    }
    
    func appendContentsOf(array: Array<ValueType.Element>) {
        self.value.appendContentsOf(array)
        self.iterateThroughHandlers()
    }
}
