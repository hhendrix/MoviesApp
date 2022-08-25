//
//  Movie.swift
//  MoviesApp
//
//  Created by Harry Lopez on 17/08/22.
//

import Foundation


struct MovieResponse : Codable {
    
    let movies: [Movie]
    
    private enum CodingKeys : String , CodingKey {
        case movies = "Search"
    }
}

struct Movie : Codable {
    let title:String
    let year:String
    let imbdId:String
    let poster:String
    
    private enum CodingKeys : String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imbdId = "imdbID"
        case poster = "Poster"
    }
}
