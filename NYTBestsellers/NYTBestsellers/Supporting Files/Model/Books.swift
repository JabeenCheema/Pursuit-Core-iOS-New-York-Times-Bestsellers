//
//  Books.swift
//  NYTBestsellers
//
//  Created by Jabeen's MacBook on 1/29/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct Books: Codable {
    let results: BookInfo
}

struct BookInfo: Codable {
    let listName: String
    let weeksOnList: Int
    let amazonProductUrl: URL
    let bookdetails: [BookDetails]
    
    private enum CodingKeys: String, CodingKey {
        case listName = "list_name"
        case weeksOnList = "weeks_on_list"
        case amazonProductUrl = "amazon_product_url"
        case bookdetails = "book_details"
        
    }
}
struct BookDetails: Codable {
    let title: String
    let description: String
    let primary_isbn13: String
    
}
