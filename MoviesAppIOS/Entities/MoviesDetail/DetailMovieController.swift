//
//  DetailMovieController.swift
//  MoviesAppIOS
//
//  Created by Andres Rivas on 01/03/2020.
//  Copyright © 2020 Andres Rivas. All rights reserved.
//

import UIKit
import SDWebImage
import ViewAnimator

class DetailMovieController: UIViewController {
    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var textDetailMovie: UITextView!
    var movie: ResultsItems?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupAnimation()
    }
    
    func setupViews() {
        self.textDetailMovie.text = movie?.overview
        
        self.imageMovie.sd_setImage(with: URL(string: ImageUtils.getImageUrl(resource: movie!.backdropPath!)), placeholderImage: UIImage(named: Constants.PLACE_HOLDER_IMAGE))
    }
    
    func setupAnimation() {
        let animations = AnimationType.from(direction: .top, offset: 30.0)
        self.imageMovie.animate(animations: [animations], duration: 4)
    }

}
