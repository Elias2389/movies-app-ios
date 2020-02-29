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

class ViewController: UIViewController, MoviesListViewProtocol {
    @IBOutlet weak var tableView: UITableView!
    var presenter: MoviesListPresenterProtocol?
    var movies: [ResultsItems] = []
    let cellName: String = "cell"
    let placeHolderName: String = "PlaceHolder"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPresenter()
        
        self.presenter?.fetchMoviesList()
    }
    
    func successMoviesList(movies: [ResultsItems]) {
        self.movies = movies
        self.tableView.reloadData()
    }
    
    func setPresenter() {
        self.presenter = MoviesListPresenter(view: self)
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
        
        cell.imageItem.sd_setImage(with: URL(string: imageUrl), placeholderImage: UIImage(named: placeHolderName))
        
        cell.titleItem.text = movie.title

        return cell
    }
    
}
