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
    
    
    let titleSectionLabel: UILabel = {
        let label = UILabel()
        label.text = "App Section here"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 24)
        return label
    }()
    
    let horizontalController = AppsHorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
      
        let verticalStackView = UIStackView(arrangedSubviews: [titleSectionLabel,horizontalController.view])
        addSubview(verticalStackView)
        verticalStackView.axis = .vertical
        verticalStackView.fillSuperview(padding: .init(top: 12, left: 16, bottom: 0, right: 12))

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
