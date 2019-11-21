//
//  AppsHeaderModel.swift
//  AppStore Using JSON API
//
//  Created by Douglas Moreira on 21/11/19.
//  Copyright © 2019 Douglas Moreira. All rights reserved.
//

import Foundation

struct AppsHeaderModel: Decodable {
    let name, imageUrl, tagline: String
}
