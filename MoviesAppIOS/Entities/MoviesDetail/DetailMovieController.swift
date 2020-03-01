//
//  DetailMovieController.swift
//  MoviesAppIOS
//
//  Created by Andres Rivas on 01/03/2020.
//  Copyright © 2020 Andres Rivas. All rights reserved.
//

import UIKit
import SDWebImage

class DetailMovieController: UIViewController {
    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var textDetailMovie: UITextView!
    
    var movie: ResultsItems?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    func setupViews() {
        self.textDetailMovie.text = movie?.overview
        
        let imageUrl = Constants.URL_IMAGE + (movie?.posterPath!)!
        self.imageMovie.sd_setImage(with: URL(string: imageUrl), placeholderImage: UIImage(named: Constants.PLACE_HOLDER_IMAGE))
    }

}
