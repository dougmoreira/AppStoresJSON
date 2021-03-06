//
//  SearchResultCell.swift
//  AppStore Using JSON API
//
//  Created by Douglas Moreira on 21/10/19.
//  Copyright © 2019 Douglas Moreira. All rights reserved.
//

import UIKit

class SearchResultCell: UICollectionViewCell {

    var appResult: Result! {
        didSet {
            nameLabel.text = appResult.trackName
            categoryLabel.text = appResult.primaryGenreName
            ratingsLabel.text = "Rating: \(appResult.averageUserRating ?? 0)"
            appIconImageView.sd_setImage(with: URL(string: appResult.artworkUrl100))
            screenShotImageView1.sd_setImage(with: URL(string: appResult.screenshotUrls[0]))
            if appResult.screenshotUrls.count > 1{
                screenShotImageView2.sd_setImage(with: URL(string: appResult.screenshotUrls[1]))
            }
            if appResult.screenshotUrls.count > 2{
                screenShotImageView3.sd_setImage(with: URL(string: appResult.screenshotUrls[2]))
            }
        }
    }

    let appIconImageView: UIImageView = {
        let image = UIImageView()
        image.heightAnchor.constraint(equalToConstant: 64).isActive = true
        image.widthAnchor.constraint(equalToConstant: 64).isActive = true
        image.layer.cornerRadius = 12
        image.clipsToBounds = true
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
        button.titleLabel?.font = UIFont(name: "boldSystemFont", size: 16)
        button.layer.cornerRadius = 16
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.centerYInSuperview()
        return button
    }()


    func createScreenShotImageView() -> UIImageView{
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 12
        image.layer.borderWidth = 0.5
        image.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        image.contentMode = .scaleAspectFill
        return image
    }

    lazy var screenShotImageView1 = self.createScreenShotImageView()
    lazy var screenShotImageView2 = self.createScreenShotImageView()
    lazy var screenShotImageView3 = self.createScreenShotImageView()

    override init(frame: CGRect){
        super.init(frame: frame)
        backgroundColor = .white

        let labelStackView = UIStackView(arrangedSubviews: [
            nameLabel,categoryLabel,ratingsLabel
        ])
        labelStackView.axis = .vertical

        let infoTopStackView = UIStackView(arrangedSubviews: [
            appIconImageView, labelStackView, getButton])


        let screenShotStackView = UIStackView(arrangedSubviews: [
            screenShotImageView1,screenShotImageView2, screenShotImageView3])

        screenShotStackView.spacing = 12
        screenShotStackView.distribution = .fillEqually
        screenShotStackView.translatesAutoresizingMaskIntoConstraints = false


        infoTopStackView.spacing = 12
        infoTopStackView.translatesAutoresizingMaskIntoConstraints = false
        infoTopStackView.alignment = .center

        let mainStackView = UIStackView(arrangedSubviews: [
            infoTopStackView, screenShotStackView
            ])
        mainStackView.axis = .vertical
        mainStackView.spacing = 16

        addSubview(mainStackView)
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: self.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            mainStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
        NSLayoutConstraint.activate([
            infoTopStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            infoTopStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            infoTopStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            ])
        NSLayoutConstraint.activate([
            screenShotStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            screenShotStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            screenShotStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }



}
