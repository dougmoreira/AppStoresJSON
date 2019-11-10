//
//  AppsPageHeader.swift
//  AppStore Using JSON API
//
//  Created by Douglas Moreira on 10/11/19.
//  Copyright © 2019 Douglas Moreira. All rights reserved.
//

import UIKit

class AppsPageHeader: UICollectionReusableView {
    
    let headerHorizontalController = AppsHeaderController()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        headerHorizontalController.view.backgroundColor = .yellow
        addSubview(headerHorizontalController.view)
        headerHorizontalController.view.fillSuperview()
    
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
