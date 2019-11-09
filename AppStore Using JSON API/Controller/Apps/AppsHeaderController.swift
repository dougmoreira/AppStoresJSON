//
//  AppsHeaderController.swift
//  AppStore Using JSON API
//
//  Created by Douglas Moreira on 09/11/19.
//  Copyright © 2019 Douglas Moreira. All rights reserved.
//

import UIKit

class AppsHeaderController: BaseListController, UICollectionViewDelegateFlowLayout {
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .yellow
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout{
            layout.scrollDirection = .vertical
        }
        
    }
}
