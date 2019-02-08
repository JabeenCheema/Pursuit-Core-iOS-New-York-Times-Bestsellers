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
            // let's see if we can get the data from the file
            if let data = FileManager.default.contents(atPath: path) {
                // if we got data from the file - let's actually decode it, It's time to decode it
                do { // we want to decode it and assign the output to the var favorite; [Favorite]
                    favorite = try PropertyListDecoder().decode([Favorite].self, from: data)
                } catch {
                    print("property list decoding error: \(error)")
                }
            } else { // if we do not get data from the file
                print("data is nil")
            }
            
        } else { // if the file doesn't exist
            print("\(filename) does not exist")
        }
    return favorite
    }

}









