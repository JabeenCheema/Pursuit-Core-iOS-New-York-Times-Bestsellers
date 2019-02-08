//
//  Favorite.swift
//  NYTBestsellers
//
//  Created by Jabeen's MacBook on 2/7/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct Favorite: Codable {
    let title: String
    let description: String
    let imageData: Data? 
}
