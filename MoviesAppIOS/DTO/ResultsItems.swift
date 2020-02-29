//
//  ResultsItems.swift
//  MoviesAppIOS
//
//  Created by Andres Rivas on 25/02/2020.
//  Copyright © 2020 Andres Rivas. All rights reserved.
//

import Foundation

struct ResultsItems: Codable {
    let overview: String
    let title: String
    var posterPath: String?
    var backdropPath: String?
    
    enum CodingKeys: String, CodingKey {
        case overview = "overview"
        case title = "title"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
    }

}
