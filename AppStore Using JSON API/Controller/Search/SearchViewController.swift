//
//  AppsSearchViewController.swift
//  AppStore Using JSON API
//
//  Created by Douglas Moreira on 19/10/19.
//  Copyright © 2019 Douglas Moreira. All rights reserved.
//

import UIKit

class SearchViewController: BaseListController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {

    fileprivate let cellID = "cell"
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    
    let progressLoadIndicator: UIActivityIndicatorView = {
        let progress = UIActivityIndicatorView()
        progress.color = .black
        progress.startAnimating()
        progress.hidesWhenStopped = true
        return progress
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.addSubview(enterSearchTermLabel)
        enterSearchTermLabel.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor, constant: 50).isActive = true
        enterSearchTermLabel.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor, constant: -50).isActive = true
        enterSearchTermLabel.topAnchor.constraint(equalTo: collectionView.topAnchor, constant: 100).isActive = true
        
        
        
        setupSearchBar()

    }
    
    fileprivate func setupSearchBar(){
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    
    fileprivate let enterSearchTermLabel: UILabel = {
        let label = UILabel()
        label.text = "Please enter search term above..."
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var timer : Timer?
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            Service.shared.fetchApps(searchTerm: searchText) { (res, err) in
                self.appResults = res
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                
            }
        })
        
    }
    
    fileprivate var appResults = [Result]() //variável que irá receber os dados


    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! SearchResultCell

        cell.appResult = appResults[indexPath.item]
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        enterSearchTermLabel.isHidden = appResults.count != 0
        return appResults.count
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 350)
    }

    fileprivate func fetchITunesApps(){

        Service.shared.fetchApps(searchTerm: "Twitter") { (results, err) in
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
