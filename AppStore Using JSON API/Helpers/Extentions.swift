//
//  Extentions.swift
//  AppStore Using JSON API
//
//  Created by Douglas Moreira on 02/11/19.
//  Copyright © 2019 Douglas Moreira. All rights reserved.
//

import UIKit

extension UILabel{
    convenience init(text: String, font: UIFont){
        self.init(frame: .zero)
        self.text = text
        self.font = font
    }
}
