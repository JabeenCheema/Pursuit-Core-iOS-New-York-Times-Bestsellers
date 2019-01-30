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

    static func getBooks(genre: String, completionHandler: @escaping (AppError,))






}
