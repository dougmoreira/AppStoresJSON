//
//  TodayViewController.swift
//  AppStore Using JSON API
//
//  Created by Douglas Moreira on 19/10/19.
//  Copyright © 2019 Douglas Moreira. All rights reserved.
//

import UIKit

final class TodayViewController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    private let cellID = "cellId"
    private var startingFrame: CGRect?


    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.backgroundColor = #colorLiteral(red: 0.9489335418, green: 0.9490664601, blue: 0.9488916993, alpha: 1)
        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: cellID)
        navigationController?.isNavigationBarHidden = true
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! TodayCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 64, height: 450)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 32, left: 0, bottom: 32, right: 0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let redView = UIView()
        redView.backgroundColor = .red
        view.addSubview(redView)
        redView.frame = CGRect(x: 0, y: 0, width: 100, height: 200)
        redView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleRemoveRedView)))
        
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        
        guard let startingFrame = cell.superview?.convert(cell.frame, to: nil) else { return }
        self.startingFrame = startingFrame
        
        redView.layer.cornerRadius = 16
        redView.frame = startingFrame
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            redView.frame = self.view.frame
        }, completion: nil)
    }
        
    @objc func handleRemoveRedView(gesture: UITapGestureRecognizer) {
//        gesture.view?.removeFromSuperview()
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            gesture.view?.frame = self.startingFrame ?? .zero
            
        }, completion: { _ in
            gesture.view?.removeFromSuperview()
        })
        
        
    }
    
    
    
}
