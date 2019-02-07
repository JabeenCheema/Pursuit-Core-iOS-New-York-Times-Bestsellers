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
    
    private var googleData = [ImageInfo]() {
        didSet {
            DispatchQueue.main.async {
                self.bestSellerView.collectionView.reloadData()
            }
        }
    }
    
    
    
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
    
  override func viewWillAppear(_ animated: Bool) {
    if let genreListName = UserDefaults.standard.object(forKey: "genre") as? String {
        if let index = genres.firstIndex(where:{ (genre) -> Bool in
            return genre.listName == genreListName
        }) {
            genres.swapAt(0, index)
        }
    }
    
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
            } else if let genres = data {
                self.genres = genres
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
        let book = books[indexPath.row]
        cell.label.text = "\(book.weeksOnList) week(s) on best seller list"
        cell.textViewDescription.text = book.bookdetails.first?.description
        
        APIClient.getGoogleData(isbn: book.bookdetails[0].primary_isbn13) { (appError, googleData) in
            if let appError = appError {
                print(appError.errorMessage())
            } else if let imageInfo = googleData {
                self.books[indexPath.row].googleInfo = imageInfo.first
                ImageHelper.fetchImageFromNetwork(urlString: imageInfo[0].volumeInfo.imageLinks.smallThumbnail ?? "", completion: { (appError, uiImage) in
                    if let appError = appError {
                        print(appError.errorMessage())
                    } else if let uiImage = uiImage {
                        cell.imageView.image = uiImage
                    }
                })
            }
        }
    
    
    return cell
}

func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    let book = books[indexPath.row]
    let detailedViewController = BestSellerDetailedViewController()
    detailedViewController.book = book 
    
    navigationController?.pushViewController(detailedViewController, animated: true)
    
    
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let genreSelected = genres[row]
        APIClient.getBooks(genre: genreSelected.listNameEncoded) { (appError,books ) in
            if let appError = appError {
                print(appError.errorMessage())
            } else if let books = books {
                self.books = books
            }
        }
    }
}





