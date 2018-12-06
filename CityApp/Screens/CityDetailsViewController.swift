//
//  CityDetailsViewController.swift
//  TripAdvisor Cities
//
//  Created by Adrian Zghibarta on 12/6/18.
//  Copyright © 2018 Adrian Zghibarta. All rights reserved.
//

import UIKit
import Kingfisher

class CityDetailsViewController: UIViewController {
    
    //
    //
    // -------------------------------------------------------------------------------
    // MARK: - Outlets
    
    @IBOutlet weak var imageViewShadowView: UIView?
    @IBOutlet weak var imageViewContainerView: UIView?
    @IBOutlet weak var cityImageView: UIImageView?
    @IBOutlet weak var cityNameLabel: UILabel?
    @IBOutlet weak var countryNameLabel: UILabel?
    @IBOutlet weak var cityInfoLabel: UILabel?
    
    //
    //
    // -------------------------------------------------------------------------------
    // MARK: - Properties
    
    var city: City? {
        didSet {
            self.updateView()
        }
    }
    
    //
    //
    // -------------------------------------------------------------------------------
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "city_details".localized()
        self.updateView()
        self.setupView()
    }
    
    //
    //
    // -------------------------------------------------------------------------------
    // MARK: - Utils
    
    private func setupView() {
        self.imageViewShadowView?.setDropShadow()
        self.imageViewShadowView?.setBorderRadius(radius: 8)
        self.imageViewContainerView?.setBorderRadius(radius: 8)
    }
    
    private func updateView() {
        let noDataString = "no_data".localized()
        if let city = self.city {
            self.cityImageView?.kf.setImage(with: city.imageUrl, placeholder: UIImage(named: "Placeholder"), options: nil, progressBlock: nil, completionHandler: nil)
            self.cityNameLabel?.text = city.name ?? noDataString
            self.countryNameLabel?.text = city.country ?? noDataString
            self.cityInfoLabel?.text = city.information ?? noDataString
        }
        else {
            self.cityNameLabel?.text = noDataString
            self.countryNameLabel?.text = noDataString
            self.cityInfoLabel?.text = noDataString
        }
    }
}


