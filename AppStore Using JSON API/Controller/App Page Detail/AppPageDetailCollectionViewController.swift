//
//  AppPageDetailCollectionViewController.swift
//  AppStore Using JSON API
//
//  Created by Douglas Moreira on 25/11/19.
//  Copyright © 2019 Douglas Moreira. All rights reserved.
//

import UIKit


class AppPageDetailCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellID = "cellID"
    var appID: String! {
        didSet{
            let urlString = "http://itunes.apple.com/lookup?id=\(appID ?? "")"
            Service.shared.fetchGenericJSONData(urlString: urlString) { (result: SearchResult?, err) in
                print(result?.results.first?.description)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        
        collectionView.register(AppDetailImageViewCollectionViewCell.self, forCellWithReuseIdentifier: "previewCell")
        collectionView.register(AppPageDatailHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: cellID)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: cellID, for: indexPath) as! AppPageDatailHeaderCollectionReusableView
        return header
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
 
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 460)
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "previewCell", for: indexPath) as! AppDetailImageViewCollectionViewCell
        return cell
    }
    
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
//        return .init(width: view.frame.width, height: 300)
//    }
    
    
    init(){
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
