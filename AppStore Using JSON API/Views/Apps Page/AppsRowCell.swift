//
//  AppsRowCell.swift
//  AppStore Using JSON API
//
//  Created by Douglas Moreira on 05/11/19.
//  Copyright © 2019 Douglas Moreira. All rights reserved.
//

import UIKit

class AppsRowCell: UICollectionViewCell{
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = UIColor(white: 0.95, alpha: 1)
        image.layer.cornerRadius = 12
        image.clipsToBounds = true
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let AppNameLabel: UILabel = {
        let label = UILabel()
        label.text = "App Title Here"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    let AppCompanyNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Company name here"
        label.font = .boldSystemFont(ofSize: 12)
        return label
    }()
    
    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.blue, for: .normal)
        button.setTitle("GET", for: .normal)
        button.titleLabel?.font = UIFont(name: "boldSystemFont", size: 16)
        button.layer.cornerRadius = 16
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.centerYInSuperview()
        return button
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        backgroundColor = .white
        
        let verticalStackView = UIStackView(arrangedSubviews:
        [AppNameLabel,AppCompanyNameLabel])
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 16
                
        let stackView = UIStackView(arrangedSubviews:
        [imageView, verticalStackView, getButton])
        stackView.spacing = 16
        stackView.alignment = .center
        
        
        imageView.constrainWidth(constant: 64)
        imageView.constrainHeight(constant: 64)
        AppCompanyNameLabel.topAnchor.constraint(equalTo: AppNameLabel.bottomAnchor, constant: 2).isActive = true
        
        addSubview(stackView)
        stackView.fillSuperview() //function inside my help class
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
