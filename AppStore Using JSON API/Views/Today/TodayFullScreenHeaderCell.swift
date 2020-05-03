//
//  AppFullScreenHeaderCell.swift
//  AppStore Using JSON API
//
//  Created by Douglas Moreira on 03/05/20.
//  Copyright © 2020 Douglas Moreira. All rights reserved.
//

import UIKit

final class TodayFullScreenHeaderCell: UITableViewCell {
    
    // MARK: - View Layout
    
    private let todayCell = TodayCell()
    let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "close_button"), for: .normal)
        return button
    }()

    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViews()
        constrainHeaderCell()
        constrainCloseButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - AddSubViews
    
    private func addSubViews() {
        addSubview(todayCell)
        addSubview(closeButton)
    }
    
    // MARK: - Constrains
    
    private func constrainHeaderCell() {
        todayCell.fillSuperview()
    }
    
    private func constrainCloseButton() {
        closeButton.anchor(
            top: topAnchor,
            leading: nil,
            bottom: nil,
            trailing: trailingAnchor,
            padding: .init(top: 12, left: 0, bottom: 0, right: 12),
            size: .init(width: 80, height: 38)
        )
        
    }
}
