//
//  BestsellersDetailedView.swift
//  NYTBestsellers
//
//  Created by Jabeen's MacBook on 1/29/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestsellersDetailedView: UIView {

    lazy var bookimage: UIImageView = {
        let bookimage = UIImageView(image: UIImage(named: "phimage"))
        bookimage.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        return bookimage
    }()

    lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "hello"
        label.backgroundColor = .red
        return label
    }()
    
  

    lazy var textViewDescription: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .lightGray
        return textView
    }()

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        addSubview(bookimage)
        addSubview(label)
        addSubview(textViewDescription)
        setupBookImage()
        setupLabel()
        setupTextViewDescription()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupBookImage() {
        bookimage.translatesAutoresizingMaskIntoConstraints = false
        bookimage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 11).isActive = true
        bookimage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        bookimage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        bookimage.heightAnchor.constraint(equalToConstant: 375).isActive = true
    }

    private func setupLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: bookimage.bottomAnchor, constant: 11).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
    }

    private func setupTextViewDescription() {
        textViewDescription.translatesAutoresizingMaskIntoConstraints = false
        textViewDescription.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 11).isActive = true
        textViewDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        textViewDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        textViewDescription.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -11).isActive = true
    }

}
