//
//  AppsHorizontalController.swift
//  AppStore Using JSON API
//
//  Created by Douglas Moreira on 02/11/19.
//  Copyright © 2019 Douglas Moreira. All rights reserved.
//

import UIKit

let cellID = "id"


class AppsHorizontalController: HorizontalSnappingController, UICollectionViewDelegateFlowLayout{
    

    var appGroup: AppGroup?
    var didSelecHandler: ((FeedResult) -> ())?
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let app = appGroup?.feed.results[indexPath.item]{
            print("Clicou em \(app.name)")
            didSelecHandler?(app)
        }
            
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(AppsRowCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.isPagingEnabled = true
        
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appGroup?.feed.results.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! AppsRowCell
        let app = appGroup?.feed.results[indexPath.item]
        cell.AppNameLabel.text = app?.name
        cell.AppCompanyNameLabel.text = app?.artistName
        cell.imageView.sd_setImage(with: URL(string: app?.artworkUrl100 ?? ""))

        return cell
    }
    
    let topBottomPadding: CGFloat = 12
    let lineSpacing: CGFloat = 10
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.height - 4 * topBottomPadding - 2 * lineSpacing) / 3
        return .init(width: view.frame.width - 48, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: topBottomPadding, left: 0, bottom: 0, right: 0)
    }
    
    
    
    
}
