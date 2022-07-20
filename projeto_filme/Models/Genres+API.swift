//
//  Genres+API.swift
//  projeto_filme
//
//  Created by matheusvb on 20/07/22.
//

import UIKit

extension Genre {
    static let urlComponents = URLComponents(string: "https://api.themoviedb.org/")!

    //MARK: - Popular download
    
    static func genreAPI() async -> [Genre] {
        var components = Genre.urlComponents
        components.path = "/3/genre/movie/list"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: Movie.apiKey)
        ]
        
        let session = URLSession.shared
        
        print(components.url)
        
        do {
            let (data, response) = try await session.data(from: components.url!)
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let genreResult = try decoder.decode(GenresResponse.self, from: data)
            
            //print(genreResult.results.count)
            
            return genreResult.results
            
        } catch {
            print(error)
        }
        
        return []
    }
    
}
