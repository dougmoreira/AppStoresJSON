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

    func fetchApps(completion: @escaping ([Result], Error?) -> ()){
        print("Fetching itunes file from service layer")

        let urlString = "https://itunes.apple.com/search?term=google&entity=software"
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
                //                print(searchResult)
                completion(searchResult.results, nil)

            }catch let jsonError{
                print("Faield to decode json:", jsonError)
                completion([], jsonError)
            }

            //teste

            }.resume()// isso inicia o pedido

    }
}
