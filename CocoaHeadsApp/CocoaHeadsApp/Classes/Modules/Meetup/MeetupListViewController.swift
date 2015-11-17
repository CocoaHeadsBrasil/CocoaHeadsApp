//
//  MeetupListViewController.swift
//  CocoaHeadsApp
//
//  Created by Bruno Bilescky on 06/11/15.
//  Copyright © 2015 CocoaHeads Brasil. All rights reserved.
//

import UIKit

@IBDesignable
class MeetupListViewController: UIViewController {

    @IBOutlet weak var nibView :MeetupListView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "CocoaHeads BR"
    }

}
