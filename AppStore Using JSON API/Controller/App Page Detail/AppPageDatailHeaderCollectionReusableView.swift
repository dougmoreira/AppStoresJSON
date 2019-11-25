//
//  AppPageDatailHeaderCollectionReusableView.swift
//  AppStore Using JSON API
//
//  Created by Douglas Moreira on 25/11/19.
//  Copyright © 2019 Douglas Moreira. All rights reserved.
//

import UIKit

class AppPageDatailHeaderCollectionReusableView: UICollectionReusableView {
    @IBOutlet var HeaderCollectionView: AppPageDatailHeaderCollectionReusableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    static var filename: String{
        return String(describing: self)
    }
    
    static var nib: UINib{
        return UINib(nibName: filename, bundle: nil)
    }
    
    static var headerCell: String{
        return "header"
    }
    
}
