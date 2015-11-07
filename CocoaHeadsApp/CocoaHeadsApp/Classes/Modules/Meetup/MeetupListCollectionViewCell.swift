//
//  MeetupListCollectionViewCell.swift
//  CocoaHeadsApp
//
//  Created by Bruno Bilescky on 06/11/15.
//  Copyright © 2015 CocoaHeads Brasil. All rights reserved.
//

import UIKit

class MeetupListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var meetupTitleLabel :UILabel!
    @IBOutlet weak var meetupDescriptionLabel :UILabel!
    
    let meetup = Dynamic<MeetupModel?>(nil)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        self.meetup.bind(self) { meetup in
            self.meetupTitleLabel.text = meetup?.name ?? "Indisponível"
            self.meetupDescriptionLabel.text = meetup?.meetDescription ?? "Indisponível"
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.meetup.value = nil
    }
    
}
