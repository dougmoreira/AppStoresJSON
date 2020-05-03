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
    private var appFullScreenController: UIViewController!
    
    let detailView: TodayAppDetailTableViewController = {
        let view = TodayAppDetailTableViewController()
        return view
    }()


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
        
        let appDetailFullScreen = TodayAppDetailTableViewController()
        let redView = appDetailFullScreen.view!
        view.addSubview(redView)
        
        addChild(appDetailFullScreen)
        self.appFullScreenController = appDetailFullScreen
        
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
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            gesture.view?.frame = self.startingFrame ?? .zero
            
        }, completion: { _ in
            gesture.view?.removeFromSuperview()
            self.appFullScreenController.removeFromParent()
            
        })
        
        
    }
    
    private func beginAnimationAppFullscreen() {
        self.tabBarController?.tabBar.transform = CGAffineTransform(translationX: 0, y: 100)
        self.tabBarController?.tabBar.frame.origin.y = self.view.frame.size.height
        
    }
    
    private func handleAppFullscreenDismissal() {
        self.tabBarController?.tabBar.transform = .identity
        if let tabBarFrame = self.tabBarController?.tabBar.frame {
            self.tabBarController?.tabBar.frame.origin.y = self.view.frame.size.height - tabBarFrame.height

        }
    }
    
    
    
}
