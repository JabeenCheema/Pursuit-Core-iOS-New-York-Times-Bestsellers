//
//  FavoritesView.swift
//  NYTBestsellers
//
//  Created by Jabeen's MacBook on 1/29/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesView: UIView {
    
    lazy var favoriteCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: 300, height: 300)
        layout.sectionInset = UIEdgeInsets.init(top: 15, left: 10, bottom: 15, right: 10)
        let cv = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        cv.register(FavoriteCell.self, forCellWithReuseIdentifier: "FavoriteCell")
        cv.backgroundColor = .yellow
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        self.addSubview(favoriteCollectionView)
       favVCConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func favVCConstraints() {
        favoriteCollectionView.translatesAutoresizingMaskIntoConstraints = false
        favoriteCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        favoriteCollectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        favoriteCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        favoriteCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        
    }
    
    
    
    
    
    
    
}

