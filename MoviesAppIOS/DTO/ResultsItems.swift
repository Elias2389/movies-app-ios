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
    var poster_path: String?
    var backdrop_path: String?

}
