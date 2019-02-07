//
//  BestsellersCell.swift
//  NYTBestsellers
//
//  Created by Jabeen's MacBook on 1/29/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class BestsellersCell: UICollectionViewCell {
    let bestSellerView = BestsellersView()
    
    lazy var imageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "phimage"))
        
        return image
    }()
    lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica", size: 15.0)
        label.text = "hello"
        return label
    }()
    lazy var textViewDescription: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.isSelectable = false 
        textView.backgroundColor = .lightGray
        return textView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addSubview(imageView)
        addSubview(label)
        addSubview(textViewDescription)
        imageConstraints()
        labelConstraint()
        textViewConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
        
        
    }
    private func imageConstraints(){
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 11).isActive = true
        imageView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5).isActive = true
        imageView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.5).isActive = true
        imageView.centerXAnchor.constraint(equalTo:safeAreaLayoutGuide.centerXAnchor).isActive = true
    }
    private func labelConstraint(){
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8).isActive = true
        label.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, constant: 10).isActive = true
        
    }
    
    private func textViewConstraint(){
        textViewDescription.translatesAutoresizingMaskIntoConstraints = false
        textViewDescription.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8).isActive = true
        textViewDescription.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.3).isActive = true
        textViewDescription.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 1).isActive = true
        textViewDescription.centerXAnchor.constraint(equalTo:safeAreaLayoutGuide.centerXAnchor).isActive = true
        
    }
}
