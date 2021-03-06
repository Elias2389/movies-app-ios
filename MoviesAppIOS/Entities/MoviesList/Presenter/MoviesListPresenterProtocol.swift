//
//  MoviesListProtocol.swift
//  MoviesAppIOS
//
//  Created by Andres Rivas on 28/02/2020.
//  Copyright © 2020 Andres Rivas. All rights reserved.
//

import Foundation

protocol MoviesListPresenterProtocol {
    func fetchMoviesList()
    func successMoviesList(movies: [ResultsItems])
}
