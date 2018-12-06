//
//  File.swift
//  TripAdvisor Cities
//
//  Created by Adrian Zghibarta on 12/6/18.
//  Copyright © 2018 Adrian Zghibarta. All rights reserved.
//

import UIKit

extension UIView {
    
    
    
    /// Sets a black drop shadow with 0.3 opacity, 1 radius and [0,1] offset
    func setDropShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowRadius = 1
    }
    
    
    /// Sets a corder radius for the layer
    ///
    /// - Parameter radius: corner radius value
    func setBorderRadius(radius: CGFloat) {
        self.layer.cornerRadius = radius
    }
}
