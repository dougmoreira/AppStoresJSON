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


    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! SearchResultCell

        cell.nameLabel.text = "Here is my App name"
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
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

        let urlString = "https://itunes.apple.com/search?term=instagram&entity=software"
        guard let url = URL(string: urlString) else {return}

        // fetch data from internet


        URLSession.shared.dataTask(with: url) { (data, resp, err) in

            if let err = err{
                print("Faield to fetch apps from iTunes", err)
                return
            }

            //success

            guard let data = data else {return}
            do{
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
//                print(searchResult)

                searchResult.results.forEach({print($0.trackName, $0.primaryGenreName)})

            }catch let jsonError{
                print("Faield to decode json:", jsonError)
            }


            }.resume()// isso inicia o pedido



    }


    


}
