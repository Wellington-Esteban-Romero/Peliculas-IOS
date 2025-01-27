//
//  PeliculaResponse.swift
//  Peliculas-IOS
//
//  Created by Tardes on 27/1/25.
//

import Foundation

struct SearchResponse: Codable {
    let search: [MovieResponse]
    let response: String?
    
    private enum CodingKeys: String, CodingKey {
        case search = "Search"
        case response
    }
}

struct MovieResponse: Codable {
    let title: String
    let year: String
    let poster: String
    let plot: String?
    let runtime: String?
    let director: String?
    let genre: String?
    let country: String?
    let imdbID: String
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case poster = "Poster"
        case plot = "Plot"
        case runtime = "Runtime"
        case director = "Director"
        case genre = "Genre"
        case country = "Country"
        case imdbID
    }
}
