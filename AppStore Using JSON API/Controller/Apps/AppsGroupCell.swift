//
//  AppsGroupCell.swift
//  AppStore Using JSON API
//
//  Created by Douglas Moreira on 02/11/19.
//  Copyright © 2019 Douglas Moreira. All rights reserved.
//

import UIKit
import SDWebImage


class AppsGroupCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        addSubview(horizontalController.view)
        setupUI()
    }
    
    fileprivate func setupUI() {
        
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor.self, constant: 18).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor.self, constant: 12).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor.self, constant: 2).isActive = true
        
        horizontalController.view.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)

    }
    
    let horizontalController = AppsHorizontalController()
    let titleLabel = UILabel(text: "App Section here", font: .boldSystemFont(ofSize: 30))
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
