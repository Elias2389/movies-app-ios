//
//  MoviesListInteractor.swift
//  MoviesAppIOS
//
//  Created by Andres Rivas on 28/02/2020.
//  Copyright © 2020 Andres Rivas. All rights reserved.
//

import Foundation
import Alamofire

class MoviesListInteractor: MoviesListInteractorProtocol {
    
    var presenter: MoviesListPresenterProtocol?
    
    init(presenter: MoviesListPresenterProtocol) {
        self.presenter = presenter
    }
    
    func fetchMoviesList() {
        AF.request(Constants.URL_BASE).validate().responseDecodable(of: Results.self)
        { (response) in
           debugPrint(response)
           guard let items = response.value else { return }
            self.successMoviesList(movies: items.results)
       }
    }
    
    func successMoviesList(movies: [ResultsItems]) {
        self.presenter?.successMoviesList(movies: movies)
    }
    
    
}
