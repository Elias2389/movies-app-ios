//
//  MoviesListPresenter.swift
//  MoviesAppIOS
//
//  Created by Andres Rivas on 28/02/2020.
//  Copyright © 2020 Andres Rivas. All rights reserved.
//

import Foundation

class MoviesListPresenter: MoviesListPresenterProtocol {
    
    var view: MoviesListViewProtocol?
    var interactor: MoviesListInteractorProtocol?
    
    init(view: MoviesListViewProtocol) {
        self.view = view
        self.interactor = MoviesListInteractor(presenter: self)
    }
    
    func fetchMoviesList() {
        self.interactor?.fetchMoviesList()
    }
    
    func successMoviesList(movies: [ResultsItems]) {
        self.view?.successMoviesList(movies: movies)
    }
}
