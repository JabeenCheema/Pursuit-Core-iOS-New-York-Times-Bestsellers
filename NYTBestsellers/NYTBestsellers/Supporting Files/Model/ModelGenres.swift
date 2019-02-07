//
//  ModelGenres.swift
//  NYTBestsellers
//
//  Created by Jabeen's MacBook on 1/29/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct Genres: Codable {
    let results: [BestsellerGenre]
}
    
struct BestsellerGenre: Codable {
    
    let listName: String
    let listNameEncoded: String
    private enum CodingKeys: String, CodingKey {
        case listName = "list_name"
        case listNameEncoded = "list_name_encoded"
    }
   
}

