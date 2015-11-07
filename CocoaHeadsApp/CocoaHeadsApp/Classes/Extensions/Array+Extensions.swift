//
//  Array+Extensions.swift
//  CocoaHeadsApp
//
//  Created by Bruno Bilescky on 06/11/15.
//  Copyright © 2015 CocoaHeads Brasil. All rights reserved.
//

import UIKit

extension Array {

    func each(doThis: (element: Element) -> Void) {
        for e in self {
            doThis(element: e)
        }
    }
    
}
