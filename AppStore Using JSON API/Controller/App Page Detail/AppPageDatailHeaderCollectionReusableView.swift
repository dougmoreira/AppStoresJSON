//
//  AppPageDatailHeaderCollectionReusableView.swift
//  AppStore Using JSON API
//
//  Created by Douglas Moreira on 25/11/19.
//  Copyright © 2019 Douglas Moreira. All rights reserved.
//

import UIKit

class AppPageDatailHeaderCollectionReusableView: UICollectionReusableView {
    
    @IBOutlet weak var headerStackView: UIStackView!
    @IBOutlet weak var StackViewInterno: UIStackView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var imageProfile: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
