//
//  AppDetailImageViewCollectionViewCell.swift
//  AppStore Using JSON API
//
//  Created by Douglas Moreira on 01/12/19.
//  Copyright © 2019 Douglas Moreira. All rights reserved.
//

import UIKit

class AppDetailImageViewCollectionViewCell: UICollectionViewCell {
    
    let horizontalImageView = AppPageHorizontalPreviewImageCollectionViewController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        let verticalStackView = UIStackView(arrangedSubviews: [horizontalImageView.view])
        addSubview(verticalStackView)
        verticalStackView.axis = .vertical
        verticalStackView.fillSuperview(padding: .init(top: 4, left: 12, bottom: 12, right: 12))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
