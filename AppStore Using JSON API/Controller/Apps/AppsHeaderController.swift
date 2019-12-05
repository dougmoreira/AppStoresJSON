//
//  AppsHeaderController.swift
//  AppStore Using JSON API
//
//  Created by Douglas Moreira on 10/11/19.
//  Copyright © 2019 Douglas Moreira. All rights reserved.
//

import UIKit

class AppsHeaderController: HorizontalSnappingController, UICollectionViewDelegateFlowLayout {
    
    var headerAppsModelResults = [AppsHeaderModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.register(AppsHeaderCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)

        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return headerAppsModelResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! AppsHeaderCell
        let result = self.headerAppsModelResults[indexPath.item]
        cell.appNameLabel.text = result.name
        cell.appImageView.sd_setImage(with: URL(string: result.imageUrl))
        cell.appDescriptionLabel.text = result.tagline
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 64 , height: 300)
    }

}
