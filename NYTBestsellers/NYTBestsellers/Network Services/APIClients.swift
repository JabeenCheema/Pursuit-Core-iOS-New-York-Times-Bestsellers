//
//  APIClients.swift
//  NYTBestsellers
//
//  Created by Jabeen's MacBook on 1/29/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class APIClient {
    static func getGenres(completionHandler: @escaping(AppError?, [BestsellerGenre]?) -> Void)  {
        let urlString = "https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=\(SecretKeys.nytimesAPIKey)"
        NetworkHelper.shared.performDataTask(endpointURLString: urlString) { (appError, data) in
            if let appError = appError {
                completionHandler(appError, nil)
            }
            if let data = data {
                do {
                    let genre = try JSONDecoder().decode(Genres.self, from: data)
                    completionHandler(nil, genre.results)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
                
            }
        }
    }

    static func getBooks(genre: String, completionHandler: @escaping (AppError?,[BookInfo]?) -> Void) {
        let genreNameFormatted = genre.replacingOccurrences(of: " ", with: "-")
        let urlString = "https://api.nytimes.com/svc/books/v3/lists.json?api-key=\(SecretKeys.nytimesAPIKey)&list=\(genreNameFormatted)"
        NetworkHelper.shared.performDataTask(endpointURLString: urlString) { (appError, data) in
            if let appError = appError {
                completionHandler(appError, nil)
            }
            if let data = data {
                do {
                    let bookData = try JSONDecoder().decode(Books.self, from: data)
                    completionHandler(nil, bookData.results)
                    print("getBooks data") // if im getting data this prints out
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                    print("getBooks error") // if im not getting data this prints
                }
            }
        }
        
    }

    static func getGoogleData(isbn: String, completionHandler: @escaping (AppError?, [ImageInfo]?) -> Void) {
        
        let urlString = "https://www.googleapis.com/books/v1/volumes?q=\(isbn)&key=\(SecretKeys.googleBooksAPIKEYPart2)"
       // https://www.googleapis.com/books/v1/volumes?q=9781455567102&key=AIzaSyDRouHcMrETiC7MyeGugf_kFujKeCSAS68
        NetworkHelper.shared.performDataTask(endpointURLString: urlString) { (appError, data) in
            if let appError = appError {
                completionHandler(appError, nil)
            }
            if let data = data {
                do {
                    let googleData = try JSONDecoder().decode(ImageData.self, from: data)
                    completionHandler(nil, googleData.items)
                    print("getGoogleData is giving data")
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                    print("getGoogleData error")
                }
            }
        }
    }
}
