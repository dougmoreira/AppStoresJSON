//
//  AppGroup.swift
//  AppStore Using JSON API
//
//  Created by Douglas Moreira on 12/11/19.
//  Copyright © 2019 Douglas Moreira. All rights reserved.
//

import Foundation

struct AppGroup: Decodable {
    let feed: Feed
    
}

struct Feed: Decodable {
    let title: String
    let results: [FeedResult]
    
}

struct FeedResult: Decodable{
    let name, artistName, artworkUrl100: String
}
