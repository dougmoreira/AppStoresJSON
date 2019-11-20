//
//  AppsViewController.swift
//  AppStore Using JSON API
//
//  Created by Douglas Moreira on 19/10/19.
//  Copyright © 2019 Douglas Moreira. All rights reserved.
//

import UIKit
import SDWebImage

let headerID = "headerID"

class AppsPageController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.backgroundColor = .white
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: "id")
        collectionView.register(AppsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID)
        
        fetchData()
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "id", for: indexPath) as! AppsGroupCell
        
        let appGroup = groups[indexPath.item]
        cell.titleSectionLabel.text = appGroup.feed.title
        cell.horizontalController.appGroup = appGroup
        cell.horizontalController.collectionView.reloadData()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 0, right: 0)
    }
    
//    var editorsChoiceGames: AppGroup?
    
    var groups = [AppGroup]()
    
    fileprivate func fetchData(){
        
        Service.shared.fetchAppGroup(urlString: "https://rss.itunes.apple.com/api/v1/br/ios-apps/top-paid/all/50/explicit.json") { (appGroup, err) in
            if let group = appGroup {
                self.groups.append(group)

            }
            
            DispatchQueue.main.sync {
                self.collectionView.reloadData()
            }
        }

        Service.shared.fetchAppGroup(urlString: "https://rss.itunes.apple.com/api/v1/br/ios-apps/top-free/all/50/explicit.json") { (appGroup, err) in
            if let group = appGroup {
                self.groups.append(group)

            }
            
            DispatchQueue.main.sync {
                self.collectionView.reloadData()
            }
        }
        
        Service.shared.fetchAppGroup(urlString: "https://rss.itunes.apple.com/api/v1/br/ios-apps/top-grossing/all/50/explicit.json") { (appGroup, err) in
            if let group = appGroup {
                self.groups.append(group)

            }
            
            DispatchQueue.main.sync {
                self.collectionView.reloadData()
            }
        }
    }
    
    
    
 
    
    init(){
         super.init(collectionViewLayout: UICollectionViewFlowLayout())
     }
     
     required init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }

     
}
