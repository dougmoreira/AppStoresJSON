//
//  TodayCell.swift
//  AppStore Using JSON API
//
//  Created by Douglas Moreira on 01/05/20.
//  Copyright © 2020 Douglas Moreira. All rights reserved.
//

import UIKit

class TodayCell: UICollectionViewCell {
    
    // MARK: - View Objects
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = #imageLiteral(resourceName: "garden")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        addSubviews()
        constrainImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Add subviews
    
    private func addSubviews() {
        addSubview(imageView)
    }
    
    // MARK: - Constrains
    
    private func constrainImageView() {
        imageView.constrainHeight(constant: 200)
        imageView.constrainWidth(constant: 200)
        imageView.centerInSuperview()
        
    }
    
    // MARK: - Setup
    
    private func setup() {
        backgroundColor = .white
        layer.cornerRadius = 16
        clipsToBounds = true
    }
    
}
