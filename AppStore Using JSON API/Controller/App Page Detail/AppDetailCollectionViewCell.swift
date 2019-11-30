//
//  AppDetailCollectionViewCell.swift
//  AppStore Using JSON API
//
//  Created by Douglas Moreira on 26/11/19.
//  Copyright © 2019 Douglas Moreira. All rights reserved.
//

import UIKit

class AppDetailCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var mainViewCell: UIView!
    

    override init(frame: CGRect) {
    super.init(frame: frame)
//        commonInit()
        backgroundColor = .yellow
    }
    
    

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        commonInit()
    }

    func commonInit() {
        let bundle = Bundle.init(for: AppDetailCollectionViewCell.self)
        if let viewsToAdd = bundle.loadNibNamed("AppDetailCollectionViewCell", owner: self, options: nil), let contentView = viewsToAdd.first as? UIView {
            addSubview(contentView)
            contentView.frame = self.bounds
            contentView.autoresizingMask = [.flexibleHeight,
                                            .flexibleWidth]
        }

    }

}
