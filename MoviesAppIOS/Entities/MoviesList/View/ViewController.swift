//
//  ViewController.swift
//  MoviesAppIOS
//
//  Created by Andres Rivas on 25/02/2020.
//  Copyright © 2020 Andres Rivas. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage
import ViewAnimator

class ViewController: UIViewController, MoviesListViewProtocol {
    @IBOutlet weak var tableView: UITableView!
    var presenter: MoviesListPresenterProtocol?
    var movies: [ResultsItems] = []
    var selectedMovie: ResultsItems?
    let cellName: String = "cell"
    @IBOutlet weak var imageItem: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        setPresenter()
        setupAnimation()
        self.presenter?.fetchMoviesList()
    }
    
    func setupAnimation() {
        let animations = AnimationType.from(direction: .bottom, offset: 30.0)
        self.tableView.animate(animations: [animations], duration: 4)
    }
    
    func successMoviesList(movies: [ResultsItems]) {
        self.movies = movies
        self.tableView.reloadData()
    }
    
    func setPresenter() {
        self.presenter = MoviesListPresenter(view: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailMovie" {
            let movieDetail = segue.destination as! DetailMovieController
            movieDetail.movie = selectedMovie
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellName, for: indexPath) as! CustomTableViewCell
        let movie = self.movies[indexPath.row]
        let imageUrl = Constants.URL_IMAGE + movie.posterPath!
        
        cell.imageItem.sd_setImage(with: URL(string: imageUrl), placeholderImage: UIImage(named: Constants.PLACE_HOLDER_IMAGE))
        
        cell.titleItem.text = movie.title

        return cell
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedMovie = movies[indexPath.row]
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detailMovie", sender: self)
    }
    
}
