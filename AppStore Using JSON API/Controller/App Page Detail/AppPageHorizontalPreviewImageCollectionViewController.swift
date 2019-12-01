//
//  AppPageHorizontalPreviewImageCollectionViewController.swift
//  AppStore Using JSON API
//
//  Created by Douglas Moreira on 01/12/19.
//  Copyright © 2019 Douglas Moreira. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class AppPageHorizontalPreviewImageCollectionViewController: BaseListController,  UICollectionViewDelegateFlowLayout{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white

        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout{
            layout.scrollDirection = .horizontal
        }

    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cell.backgroundColor = .lightGray
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 120, height: view.frame.height)
    }
 

}
