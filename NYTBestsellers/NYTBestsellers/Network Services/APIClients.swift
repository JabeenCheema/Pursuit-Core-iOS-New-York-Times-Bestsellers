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
        let url = "https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=\(SecretKeys.nytimesAPIKey)"
        NetworkHelper.shared.performDataTask(endpointURLString: url) { (appError, data) in
            if let appError = appError {
                completionHandler(appError, nil)
            }
            if let data = data {
                do {
                    let data = try JSONDecoder().decode(Genres.self, from: data)
                    completionHandler(nil, data.results)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
                
            }
        }
    }

    static func getBooks(genre: String, completionHandler: @escaping (AppError?,[BookInfo]?) -> Void) {
        let genreNameFormatted = genre.replacingOccurrences(of: " ", with: "-")
        let url = "https://api.nytimes.com/svc/books/v3/lists.json?api-key=\(SecretKeys.googleBooksAPIKey)&list=\(genreNameFormatted)"
        NetworkHelper.shared.performDataTask(endpointURLString: url) { (appError, data) in
            if let appError = appError {
                completionHandler(appError, nil)
            }
            if let data = data {
                do {
                    let bookData = try JSONDecoder().decode(Books.self, from: data)
                    completionHandler(nil, bookData.results)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        }
        
    }






}
