//
//  City.swift
//  TripAdvisor Cities
//
//  Created by Adrian Zghibarta on 12/6/18.
//  Copyright © 2018 Adrian Zghibarta. All rights reserved.
//

import UIKit

class City {
    
    //
    //
    // -------------------------------------------------------------------------------
    // MARK: - Properties
    
    var name: String?
    var country: String?
    var imageUrlString: String?
    var information: String?
    var imageUrl: URL? {
        get {
            guard let imageUrlString = self.imageUrlString else {return nil}
            return URL(string: imageUrlString)
        }
    }
    
    //
    //
    // -------------------------------------------------------------------------------
    // MARK: - Initialisation
    
    init(withName name: String?, country: String?, imageUrlString: String?, information: String?) {
        self.name = name
        self.country = country
        self.imageUrlString = imageUrlString
        self.information = information
    }
}
