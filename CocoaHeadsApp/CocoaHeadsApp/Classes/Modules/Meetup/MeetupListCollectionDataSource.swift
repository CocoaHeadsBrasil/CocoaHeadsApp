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
    
    init(viewModel :MeetupListViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.items.value.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let reuseIdentifier = R.nib.meetupListCollectionViewCell.identifier
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath)
        
        guard let meetupCell = cell as? MeetupListCollectionViewCell else {
            return cell
        }
        
        meetupCell.meetup.value = viewModel.items.value[indexPath.item]
        return meetupCell
    }
    
}
