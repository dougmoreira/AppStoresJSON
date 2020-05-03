//
//  TodayDetailCell.swift
//  AppStore Using JSON API
//
//  Created by Douglas Moreira on 02/05/20.
//  Copyright © 2020 Douglas Moreira. All rights reserved.
//

import UIKit

final class TodayDetailCell: UITableViewCell {
    
    // MARK: - Layout View
    
    private lazy var atributedText = NSMutableAttributedString(string: "Greate Apps:", attributes: [.foregroundColor: UIColor.black])

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello Douglas!"
        label.attributedText = atributedText
        return label
    }()
    
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        constrainDescription()
        setupDescriptionLabel()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - AddSubviews
    
    private func addSubviews() {
        addSubview(descriptionLabel)
    }
    
    // MARK: - Constrains
    
    private func constrainDescription() {
        descriptionLabel.fillSuperview(padding: .init(top: 0, left: 24, bottom: 0, right: 24))
        
    }
    
    // MARK: - Setup
    
    private func setupDescriptionLabel() {
        atributedText.append(NSAttributedString(string: " App Store é um serviço de distribuição digital de aplicativos desenvolvido e operado pela Apple Inc. Ela é a loja oficial de aplicativos para o sistema operacional iOS, da Apple.", attributes: [.foregroundColor: UIColor.gray]))
        atributedText.append(NSAttributedString(string: "\n\n\nA loja permite que os usuários naveguem e baixem aplicativos desenvolvidos com o kit de desenvolvimento de software para iOS. ", attributes: [.foregroundColor: UIColor.gray]))
        
        descriptionLabel.attributedText = atributedText
        descriptionLabel.numberOfLines = .zero
        descriptionLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
    }
    
}
