//
//  SearchProvider.swift
//  Peliculas-IOS
//
//  Created by Tardes on 27/1/25.
//

import Foundation

class SearchProvider {
    
    private static var endPoint = "https://www.omdbapi.com/?"
    
    static func findMoviesByName (name: String, key: String = "fb7aca4") async throws -> [MovieResponse] {
        let url = URL(string: "\(endPoint)s=\(name)&apikey=\(key)")!
        let (data, _) =  try await URLSession.shared.data(from: url)
        let decoded = try JSONDecoder().decode(SearchResponse.self, from: data)
        return decoded.search
    }
    
    static func findMovieByImdbID (id: String, key: String = "fb7aca4") async throws -> MovieResponse {
        let url = URL(string: "\(endPoint)i=\(id)&apikey=\(key)")!
        let (data, _) =  try await URLSession.shared.data(from: url)
        let decoded = try JSONDecoder().decode(MovieResponse.self, from: data)
        return decoded
    }
    
}
