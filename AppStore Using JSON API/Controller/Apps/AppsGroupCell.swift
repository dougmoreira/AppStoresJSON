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
        setupUI()
    }
    
    fileprivate func setupUI() {
        backgroundColor = .purple
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "App Section"
        label.font = .boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    let titleLabel = UILabel(text: "App Section here", font: .boldSystemFont(ofSize: 30)) isnt work because is missing some constraint...
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
