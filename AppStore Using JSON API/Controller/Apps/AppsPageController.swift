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
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView(style: .whiteLarge)
        aiv.color = .black
        aiv.startAnimating()
        aiv.hidesWhenStopped = true
        return aiv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.backgroundColor = .white
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: "id")
        collectionView.register(AppsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID)
        
        view.addSubview(activityIndicatorView)
        activityIndicatorView.fillSuperview()
        fetchData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath) as! AppsPageHeader
        header.headerHorizontalController.headerAppsModelResults = self.appsHeaderModelResult
        header.headerHorizontalController.collectionView.reloadData()
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
        cell.horizontalController.didSelecHandler = { FeedResult in
            
            let controller = AppPageDetailCollectionViewController()
            self.navigationController?.pushViewController(controller, animated: true)
            controller.navigationItem.title = FeedResult.name
            controller.appID = FeedResult.id
            
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 0, right: 0)
    }
        
    var groups = [AppGroup]()
    var appsHeaderModelResult = [AppsHeaderModel]()
    
    fileprivate func fetchData(){
        
        var topPaidAppsGroup: AppGroup?
        var topFreeAppsGroup: AppGroup?
        var topGrossingAppsGroup: AppGroup?
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        Service.shared.fetchHeaderApps { (apps, err) in
            dispatchGroup.leave()
            self.appsHeaderModelResult = apps ?? []
            //acima estou armazenando todo o resultado que esta dentro de apps denro da minha variavel Model
        }
        
        dispatchGroup.enter()
        Service.shared.fetchAppGroup(urlString: "https://rss.itunes.apple.com/api/v1/br/ios-apps/top-free/all/50/explicit.json") { (appGroup, err) in
            dispatchGroup.leave()
            
            topFreeAppsGroup = appGroup
            
            DispatchQueue.main.sync {
                self.collectionView.reloadData()
            }
        }
        
        dispatchGroup.enter()
        Service.shared.fetchAppGroup(urlString: "https://rss.itunes.apple.com/api/v1/br/ios-apps/top-paid/all/50/explicit.json") { (appGroup, err) in
            dispatchGroup.leave()
            topPaidAppsGroup = appGroup
            
            DispatchQueue.main.sync {
                self.collectionView.reloadData()
            }
        }

        dispatchGroup.enter()
        Service.shared.fetchAppGroup(urlString: "https://rss.itunes.apple.com/api/v1/br/ios-apps/top-grossing/all/50/explicit.json") { (appGroup, err) in
            dispatchGroup.leave()
            
            topGrossingAppsGroup = appGroup
            
            DispatchQueue.main.sync {
                self.collectionView.reloadData()
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            print("complete dispatch group tasks...")
            
            self.activityIndicatorView.stopAnimating()
            
            if let group = topFreeAppsGroup{
                self.groups.append(group)
            }
            if let group = topPaidAppsGroup{
                self.groups.append(group)
            }
            if let group = topGrossingAppsGroup{
                self.groups.append(group)
            }
            
            self.collectionView.reloadData()
        }
    }
    
    init(){
         super.init(collectionViewLayout: UICollectionViewFlowLayout())
     }
     
     required init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }

     
}
