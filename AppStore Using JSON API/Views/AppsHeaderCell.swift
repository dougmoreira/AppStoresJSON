//
//  AppsHeaderCell.swift
//  AppStore Using JSON API
//
//  Created by Douglas Moreira on 10/11/19.
//  Copyright © 2019 Douglas Moreira. All rights reserved.
//

import UIKit

class AppsHeaderCell: UICollectionViewCell {
    
    let appNameLabel = UILabel(text: "App Name Here", font: .boldSystemFont(ofSize: 12))
    let appDescriptionLabel = UILabel(text: "App Description Here", font: .boldSystemFont(ofSize: 24))
    
    let appImageView : UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .blue
        image.layer.cornerRadius = 12
        image.clipsToBounds = true
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(white: 0.95, alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
