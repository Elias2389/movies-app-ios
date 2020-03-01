//
//  ImageUtils.swift
//  MoviesAppIOS
//
//  Created by Andres Rivas on 01/03/2020.
//  Copyright © 2020 Andres Rivas. All rights reserved.
//

import Foundation

class ImageUtils {
    static func getImageUrl(resource: String) -> String {
        return Constants.URL_IMAGE + resource
    }
}
