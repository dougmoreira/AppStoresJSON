//
//  SearchResult.swift
//  AppStore Using JSON API
//
//  Created by Douglas Moreira on 23/10/19.
//  Copyright © 2019 Douglas Moreira. All rights reserved.
//

import UIKit

struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Decodable {
    let trackName: String
    let primaryGenreName: String
    var averageUserRating: Float?
    let artworkUrl100: String //App Icon
    let screenshotUrls: [String]
    let formattedPrice : String
    let description: String
    let releaseNotes: String
    
}
