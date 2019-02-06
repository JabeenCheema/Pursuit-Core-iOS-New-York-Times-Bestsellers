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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.7661576846, green: 0.4653701696, blue: 0.6198025031, alpha: 1)
       self.view.addSubview(detailview)
    }
    

   

}
