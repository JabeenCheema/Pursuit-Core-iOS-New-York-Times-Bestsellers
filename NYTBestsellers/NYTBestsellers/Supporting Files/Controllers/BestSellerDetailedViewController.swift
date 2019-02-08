//
//  BestSellerDetailedViewController.swift
//  NYTBestsellers
//
//  Created by Jabeen's MacBook on 1/29/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestSellerDetailedViewController: UIViewController {

    var detailview = BestsellersDetailedView()
    
    var book: BookInfo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.7661576846, green: 0.4653701696, blue: 0.6198025031, alpha: 1)
       self.view.addSubview(detailview)
        settingObjects()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Favorite", style: .plain, target: self, action: #selector(favButtonPressed))
    }
    
    
    @objc func favButtonPressed() {
        
    }
    
    
    
    func settingObjects() {
        detailview.label.text = book.bookdetails.first?.title
        detailview.textViewDescription.text = book.bookdetails.first?.description
        
//    APIClient.getGoogleData(isbn: book.bookdetails[0].primary_isbn13) { (appError, googleData) in
//    if let appError = appError {
//    print(appError.errorMessage())
//    } else if let imageInfo = googleData {
//
//    ImageHelper.fetchImageFromNetwork(urlString: imageInfo[0].volumeInfo.imageLinks.smallThumbnail ?? "", completion: { (appError, uiImage) in
//    if let appError = appError {
//    print(appError.errorMessage())
//    } else if let uiImage = uiImage {
//    self.detailview.bookimage.image = uiImage
//    }
//    })
//    }
//    }

}
}
