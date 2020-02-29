//
//  CustomTableViewCell.swift
//  MoviesAppIOS
//
//  Created by Andres Rivas on 26/02/2020.
//  Copyright © 2020 Andres Rivas. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var imageItem: UIImageView!
    @IBOutlet weak var titleItem: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
