//
//  AppsSearchViewController.swift
//  AppStore Using JSON API
//
//  Created by Douglas Moreira on 19/10/19.
//  Copyright © 2019 Douglas Moreira. All rights reserved.
//

import UIKit

class SearchViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    fileprivate let cellID = "cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellID)

        fetchITunesApps()

    }

    fileprivate var appResults = [Result]() //variável que irá receber os dados


    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! SearchResultCell

        let result = appResults[indexPath.item]
        cell.nameLabel.text = result.trackName
        cell.categoryLabel.text = result.primaryGenreName
        cell.ratingsLabel.text = "Rating: \(result.averageUserRating ?? 0)"
        cell.appIconImageView.sd_setImage(with: URL(string: result.artworkUrl100))
        cell.screenShotImageView1.sd_setImage(with: URL(string: result.screenshotUrls[0]))
        if result.screenshotUrls.count > 1{
            cell.screenShotImageView2.sd_setImage(with: URL(string: result.screenshotUrls[1]))
        }
        if result.screenshotUrls.count > 2{
            cell.screenShotImageView3.sd_setImage(with: URL(string: result.screenshotUrls[2]))
        }


        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appResults.count
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 350)
    }

    init(){
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    fileprivate func fetchITunesApps(){

        Service.shared.fetchApps { (results, err) in
            if let err  = err{
                print("Faield to fetch apps:", err)
                return
            }

            self.appResults = results
            DispatchQueue.main.sync {
                self.collectionView.reloadData()
            }
            
        }


    }


    


}
