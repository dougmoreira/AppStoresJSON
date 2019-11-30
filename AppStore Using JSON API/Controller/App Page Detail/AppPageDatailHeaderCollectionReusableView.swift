//
//  AppPageDatailHeaderCollectionReusableView.swift
//  AppStore Using JSON API
//
//  Created by Douglas Moreira on 25/11/19.
//  Copyright © 2019 Douglas Moreira. All rights reserved.
//

import UIKit

class AppPageDatailHeaderCollectionReusableView: UICollectionReusableView {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var AppNameLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        
        AppNameLabel.text = "Oi Douglasssss"
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    func commonInit() {
        let bundle = Bundle.init(for: AppPageDatailHeaderCollectionReusableView.self)
        if let viewsToAdd = bundle.loadNibNamed("AppPageDatailHeaderCollectionReusableView", owner: self, options: nil), let contentView = viewsToAdd.first as? UIView {
            addSubview(contentView)
            contentView.frame = self.bounds
            contentView.autoresizingMask = [.flexibleHeight,
                                            .flexibleWidth]
        }

    }

}
