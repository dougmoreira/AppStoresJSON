//
//  AppDetailComentsCollectionReusableView.swift
//  AppStore Using JSON API
//
//  Created by Douglas Moreira on 01/12/19.
//  Copyright © 2019 Douglas Moreira. All rights reserved.
//

import UIKit

class AppDetailComentsCollectionReusableView: UICollectionReusableView {
 
    @IBOutlet weak var mainStackView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    func commonInit() {
        let bundle = Bundle.init(for: AppDetailComentsCollectionReusableView.self)
        if let viewsToAdd = bundle.loadNibNamed("AppDetailComentsCollectionReusableView", owner: self, options: nil), let contentView = viewsToAdd.first as? UIView {
            addSubview(contentView)
            contentView.frame = self.bounds
            contentView.autoresizingMask = [.flexibleHeight,
                                            .flexibleWidth]
        }

    }
    
}
