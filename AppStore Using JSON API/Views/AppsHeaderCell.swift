//
//  AppsHeaderCell.swift
//  AppStore Using JSON API
//
//  Created by Douglas Moreira on 10/11/19.
//  Copyright © 2019 Douglas Moreira. All rights reserved.
//

import UIKit

class AppsHeaderCell: UICollectionViewCell {
    
//    let appNameLabel = UILabel(text: "App Name Here", font: .boldSystemFont(ofSize: 12))
//    let appDescriptionLabel = UILabel(text: "App Description Here", font: .boldSystemFont(ofSize: 24))
    
    let appNameLabel: UILabel = {
        let label = UILabel()
        label.text = "App Name Here"
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .blue
        return label
    }()
    
    let appDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "App Description will apear here with 2 lines and bla bla bla"
        label.font = .boldSystemFont(ofSize: 24)
        label.numberOfLines = 2
        return label
    }()
    
    
    let appImageView : UIImageView = {
        let image = UIImageView()
        image.backgroundColor = UIColor(white: 0.85, alpha: 1)
        image.layer.cornerRadius = 12
        image.clipsToBounds = true
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image    
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        let verticalStackView = UIStackView(arrangedSubviews: [appNameLabel,appDescriptionLabel,appImageView])
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 12
        
        addSubview(verticalStackView)
        verticalStackView.fillSuperview()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
