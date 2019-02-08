//
//  FavoriteManager.swift
//  NYTBestsellers
//
//  Created by Jabeen's MacBook on 2/7/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class FavoriteManager {
    static let filename = "Favorite.plist"

    static func getFavorites() -> [Favorite] {
        var favorite = [Favorite]()
        // declaring a path for the computer to go check, giving the comp directions where to go in the comp
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename).path
        
        //check if the file exists
        if FileManager.default.fileExists(atPath: path) {
            //if the file exists - we want to retrieve the data from the file
            
        } else { // if the file doesn't exist
            print("\(filename) does not exist")
        }
    }

}









