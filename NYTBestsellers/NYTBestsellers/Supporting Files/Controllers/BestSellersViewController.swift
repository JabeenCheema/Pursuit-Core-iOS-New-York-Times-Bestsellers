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
    
    private var books = [BookInfo]() {
        didSet {
            DispatchQueue.main.async {
                self.bestSellerView.collectionView.reloadData()
            }
        }
    }
    
    private var genres = [BestsellerGenre]() {
        didSet {
            DispatchQueue.main.async { // this brings the backgroundthread(where network calls happen)to the main thread (UI stuff, what the user sees)
                self.bestSellerView.pickerView.reloadAllComponents()
            }
        }
    }
    
    override func viewDidLoad() { // hungry I am, thirsty you are?
    bestSellerView.collectionView.register(BestsellersCell.self, forCellWithReuseIdentifier: "BestsellersCell")
    self.view.addSubview(bestSellerView)
       dataSourceandDelegates()
        loadGenres()
        loadBooks()
        
        

        
    }
    func dataSourceandDelegates(){
        bestSellerView.collectionView.dataSource = self
        bestSellerView.collectionView.delegate = self
        bestSellerView.pickerView.delegate = self
        bestSellerView.pickerView.dataSource = self
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
    
  
    func loadBooks() {
        APIClient.getBooks(genre:"Animals") { (appError, data) in
            if let appError = appError {
                print(appError.errorMessage())
            } else if let data = data {
                self.books = data
                dump(self.books)
            }
        }
    }
    

}

extension BestSellersViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
        
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BestsellersCell", for: indexPath) as? BestsellersCell else { return UICollectionViewCell()}
        // display the book title and description on cells
        let infoForCell = books[indexPath.row]
        cell.label.text = "\(infoForCell.weeksOnList) week(s) on best seller list"
        cell.textViewDescription.text = infoForCell.bookdetails.first?.description
        
        
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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // USE THIS TOP MAKE A CALL FOR BOOKS IN THE CATEGORY
       // APIClient.getBooks(genre: <#T##String#>, completionHandler: <#T##(AppError?, [BookInfo]?) -> Void#>)
        navigationController?.pushViewController(BestSellerDetailedViewController(), animated: true)
        
        
    }
    
}

