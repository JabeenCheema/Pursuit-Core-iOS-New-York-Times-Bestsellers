//
//  BestSellersViewController.swift
//  NYTBestsellers
//
//  Created by Jabeen's MacBook on 1/29/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellersViewController: UIViewController {

    let bestSellerView = BestsellersView()
    
    private var genres = [BestsellerGenre]() {
        didSet {
            DispatchQueue.main.async {
                self.bestSellerView.pickerView.reloadAllComponents()
            }
        }
    }
    
    override func viewDidLoad() { // hungry I am, thirsty you are?
    bestSellerView.collectionView.register(BestsellersCell.self, forCellWithReuseIdentifier: "BestsellersCell")
        self.view.addSubview(bestSellerView)
        bestSellerView.collectionView.dataSource = self
        bestSellerView.collectionView.delegate = self
        bestSellerView.pickerView.delegate = self
        bestSellerView.pickerView.dataSource = self
        loadGenres()

        
    }
   
    func loadGenres() {
        APIClient.getGenres { (appError, data) in
            if let appError = appError {
                print(appError.errorMessage())
            } else if let data = data {
                self.genres = data
            }
        }
    }
    
    
    

}

extension BestSellersViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return genres.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BestsellersCell", for: indexPath) as? BestsellersCell else { return UICollectionViewCell()}
        return cell
    }
}

extension BestSellersViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genres.count
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genres[row].listName
    }
    
}
