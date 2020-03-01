//
//  AnimationUtils.swift
//  MoviesAppIOS
//
//  Created by Andres Rivas on 01/03/2020.
//  Copyright © 2020 Andres Rivas. All rights reserved.
//

import Foundation
import ViewAnimator

class AnimationUtils {
    static func getdefaultAnimationType() -> AnimationType  {
        return AnimationType.from(direction: .bottom, offset: 30.0)
    }
}
