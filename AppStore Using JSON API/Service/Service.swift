//
//  Service.swift
//  AppStore Using JSON API
//
//  Created by Douglas Moreira on 23/10/19.
//  Copyright © 2019 Douglas Moreira. All rights reserved.
//

import UIKit
import SDWebImage

class Service {
    static let shared = Service() //singleton

    func fetchApps(searchTerm: String, completion: @escaping ([Result], Error?) -> ()){
        print("Fetching itunes file from service layer")

        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        guard let url = URL(string: urlString) else {return}
        // fetch data from internet

        URLSession.shared.dataTask(with: url) { (data, resp, err) in

            if let err = err{
                print("Faield to fetch apps from iTunes", err)
                completion([], nil)
                return
            }
            //success
            guard let data = data else {return}
            do{
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                completion(searchResult.results, nil)

            }catch let jsonError{
                print("Faield to decode json:", jsonError)
                completion([], jsonError)
            }

            }.resume()// isso inicia o pedido
    }
    
    func fetchGames(completion: @escaping (AppGroup?, Error?) -> ()){
        guard let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/50/explicit.json") else {return}
        
        URLSession.shared.dataTask(with: url){ (data,resp,err) in
            
            if let err = err{
                completion(nil,err)
                return
            }
            
            do{
                let appGroup = try JSONDecoder().decode(AppGroup.self, from: data!)
                completion(appGroup, nil)
            } catch{
                completion(nil, error)
                print("Failed to decode: ", error)
            }
            
            
            
        }.resume() //will fire our request
    }
}
