//
//  MeetupListCollectionDataSource.swift
//  CocoaHeadsApp
//
//  Created by Bruno Bilescky on 06/11/15.
//  Copyright © 2015 CocoaHeads Brasil. All rights reserved.
//

import UIKit

class MeetupListCollectionDataSource: NSObject, UICollectionViewDataSource {

    let viewModel :MeetupListViewModel
    
    init(viewModel vm :MeetupListViewModel) {
        viewModel = vm
        super.init()
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.items.value.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let reuseIdentifier = R.nib.meetupListCollectionViewCell.reuseIdentifier
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath)!
        cell.meetup.value = viewModel.items.value[indexPath.item]
        return cell
    }
    
}
