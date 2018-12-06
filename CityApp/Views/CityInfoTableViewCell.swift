//
//  CityInfoTableViewCell.swift
//  TripAdvisor Cities
//
//  Created by Adrian Zghibarta on 12/6/18.
//  Copyright © 2018 Adrian Zghibarta. All rights reserved.
//

import UIKit

class CityInfoTableViewCell: UITableViewCell {
    
    //
    //
    // -------------------------------------------------------------------------------
    // MARK: - Properties
    
    //
    //
    // -------------------------------------------------------------------------------
    // MARK: - Outles
    
    @IBOutlet weak var shadowView: UIView?
    @IBOutlet weak var mainView: UIView?
    @IBOutlet weak var cityImage: UIImageView?
    @IBOutlet weak var cityNameLabel: UILabel?
    @IBOutlet weak var countryNameLabel: UILabel?
    @IBOutlet weak var cityInfoLabel: UILabel?
    
    //
    //
    // -------------------------------------------------------------------------------
    // MARK: - Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.initView()
    }

    //
    //
    // -------------------------------------------------------------------------------
    // MARK: - Utils
    
    func initView() {
        self.shadowView?.setDropShadow()
        self.shadowView?.setBorderRadius(radius: 8)
        self.mainView?.setBorderRadius(radius: 8)
    }
}
