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

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var movies: [ResultsItems] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
        
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        let movie = self.movies[indexPath.row]
        let imageUrl = "https://image.tmdb.org/t/p/w500/"+movie.poster_path!
        
        cell.imageItem.sd_setImage(with: URL(string: imageUrl), placeholderImage: UIImage(named: "PlaceHolder"))
        
        cell.titleItem.text = movie.title

        return cell
    }
    

    
}

extension ViewController {
    func fetchData() {
        let url: String = "https://api.themoviedb.org/3/movie/popular?api_key=ed3cabd489c6883104d68f3776120f03&language=en-US&page=1"
        
        AF.request(url).validate().responseDecodable(of: Results.self) { (response) in
            debugPrint(response)
            guard let items = response.value else { return }
            self.movies = items.results
            self.tableView.reloadData()
        }
    }
}

