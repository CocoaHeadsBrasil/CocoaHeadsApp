//
//  MeetupListView.swift
//  CocoaHeadsApp
//
//  Created by Bruno Bilescky on 06/11/15.
//  Copyright © 2015 CocoaHeads Brasil. All rights reserved.
//

import UIKit

class MeetupListView: NibDesignable {

    let viewModel = MeetupListViewModel()
    var dataSource :MeetupListCollectionDataSource!
    var delegate :MeetupListCollectionDelegate!

    @IBOutlet weak var listCollectionView :UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listCollectionView.registerNib(R.nib.meetupListCollectionViewCell)
        self.dataSource = MeetupListCollectionDataSource(viewModel: self.viewModel)
        self.delegate = MeetupListCollectionDelegate(viewModel: self.viewModel)
        self.listCollectionView.dataSource = self.dataSource
        self.listCollectionView.delegate = self.delegate
        viewModel.items.bind(self) { items in
            self.listCollectionView.reloadData()
        }
        viewModel.loadMoreItens()
    }
    
}
