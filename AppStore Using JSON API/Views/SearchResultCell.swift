//
//  SearchResultCell.swift
//  AppStore Using JSON API
//
//  Created by Douglas Moreira on 21/10/19.
//  Copyright © 2019 Douglas Moreira. All rights reserved.
//

import UIKit

class SearchResultCell: UICollectionViewCell {

    let imageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .red
        image.heightAnchor.constraint(equalToConstant: 64).isActive = true
        image.widthAnchor.constraint(equalToConstant: 64).isActive = true
        image.layer.cornerRadius = 12
        return image
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "APP NAME"
        return label
    }()

    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Videos & Music Categoy"
        return label
    }()

    let ratingsLabel: UILabel = {
        let label = UILabel()
        label.text = "9.75M"
        return label
    }()

    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.blue, for: .normal)
        button.setTitle("GET", for: .normal)
        button.titleLabel?.font = UIFont(name: "boldSystemFont", size: 14)
        button.layer.cornerRadius = 12
        button.backgroundColor = .gray
        return button
    }()

    override init(frame: CGRect){
        super.init(frame: frame)
        backgroundColor = .green

        let labelStackView = UIStackView(arrangedSubviews: [
            nameLabel,categoryLabel,ratingsLabel
        ])
        labelStackView.axis = .vertical

        let stackView = UIStackView(arrangedSubviews: [
            imageView, labelStackView, getButton])


        addSubview(stackView)
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])


    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }



}
