//
//  MeetupListCollectionDelegate.swift
//  CocoaHeadsApp
//
//  Created by Bruno Bilescky on 07/11/15.
//  Copyright © 2015 CocoaHeads Brasil. All rights reserved.
//

import UIKit

class MeetupListCollectionDelegate: NSObject, UICollectionViewDelegateFlowLayout {

    let viewModel :MeetupListViewModel
    
    init(viewModel vm :MeetupListViewModel) {
        viewModel = vm
        super.init()
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(CGRectGetWidth(collectionView.frame), 200)
    }
    
    func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        guard indexPath.item > viewModel.items.value.count - 5 else {
            return
        }
        viewModel.loadMoreItens()
    }
    
}
