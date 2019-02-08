//
//  FavoriteCell.swift
//  NYTBestsellers
//
//  Created by Jabeen's MacBook on 2/7/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoriteCell: UICollectionViewCell {
    
// set up label, image, description, button
    lazy var favlabel: UILabel = {
        let favlabel = UILabel()
        favlabel.textAlignment = .center
        favlabel.text = "hello"
        return favlabel
    }()

    lazy var textViewDescription: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.isSelectable = false
        textView.backgroundColor = .lightGray
        return textView
    }()
    
    lazy var myButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        return button
    }()

    lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "phimage")
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        setupObjectsConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    public func configureCell(favoriteBook: FavoriteBook, buttonTag: Int) {
//        if let imageData = favoriteBook.imageData, let image = UIImage.init(data: imageData) {
//            bookImageView.image = image
//        }
//        favoritePopupMenuButton.tag = buttonTag
//        weekOnListLabel.text = "\(favoriteBook.bookDetails.weeksOnList) weeks on best seller list"
//        bookDescriptionTextView.text = favoriteBook.bookDetails.bookDetails[0].description
//    }
//
//    @objc private func favoritePopupMenu() {
//        delegate?.cellButtonPressed(tag: favoritePopupMenuButton.tag)
//    }
}

extension FavoriteCell {
    private func setupObjectsConstraints() {
        setupImage()
        setupMyButton()
        setupFavlabel()
        setupTextViewDescription()
    }
    
    private func setupImage() {
        addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        
        image.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        image.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        image.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.45).isActive = true
        image.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6, constant: 0).isActive = true
    }
    
    private func setupMyButton() {
        addSubview(myButton)
        myButton.translatesAutoresizingMaskIntoConstraints = false
        
        myButton.topAnchor.constraint(equalTo: topAnchor, constant: 35).isActive = true
        myButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    }
    
    private func setupFavlabel() {
        addSubview(favlabel)
        favlabel.translatesAutoresizingMaskIntoConstraints = false
        
        favlabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 11).isActive = true
        favlabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        favlabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
    }
    
    private func setupTextViewDescription() {
        addSubview(textViewDescription)
        textViewDescription.translatesAutoresizingMaskIntoConstraints = false
        
        textViewDescription.topAnchor.constraint(equalTo: favlabel.bottomAnchor, constant: 15).isActive = true
        textViewDescription.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15).isActive = true
        textViewDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        textViewDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
    }
}



