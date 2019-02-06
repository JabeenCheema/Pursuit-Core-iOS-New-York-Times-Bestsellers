//
//  GoogleImage.swift
//  NYTBestsellers
//
//  Created by Jabeen's MacBook on 1/31/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct ImageData: Codable {
    let items: [ImageInfo]
}
struct ImageInfo: Codable {
    let volumeinfo: Volume?
}
struct Volume: Codable {
    let imagelinks: ImageUrl
    let authors: [String]
    let description: String
}

struct ImageUrl: Codable {
    let smallThumbnail: String
    let thumbnail: String 
}
