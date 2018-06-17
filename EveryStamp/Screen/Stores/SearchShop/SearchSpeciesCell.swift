//
//  SearchSpeciesCell.swift
//  EveryStamp
//
//  Created by zhaolin on 2018/5/27.
//  Copyright © 2018年 zhaolin. All rights reserved.
//

import UIKit

class SearchSpeciesCell: UICollectionViewCell {
    
    @IBOutlet weak var speciesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func refreshUI(text: String) {
        speciesLabel.text = text
    }
}
