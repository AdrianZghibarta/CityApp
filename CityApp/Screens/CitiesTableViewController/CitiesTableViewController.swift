//
//  CitiesViewController.swift
//  TripAdvisor Cities
//
//  Created by Adrian Zghibarta on 12/6/18.
//  Copyright © 2018 Adrian Zghibarta. All rights reserved.
//

import UIKit
import Kingfisher

protocol CitiesTableViewModelProtocol {
    func readCities(fromFileName fileName: String, withFileExtension fileExtension: String) throws
    func numberOfRowsInSection() -> Int
    func city(at index: Int) -> City?
    var selectedCity: City? {get set}
}

class CitiesTableViewController: UITableViewController {
    
    //
    //
    // -------------------------------------------------------------------------------
    // MARK: - Properties
    
    private var viewModel: CitiesTableViewModelProtocol = CitiesTableViewModel()
    
    //
    //
    // -------------------------------------------------------------------------------
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.initView()
        self.initModel()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "ShowCityDetails") {
            if let detailsViewController = segue.destination as? CityDetailsViewController {
                detailsViewController.city = self.viewModel.selectedCity
                self.viewModel.selectedCity = nil
            }
        }
    }

    //
    //
    // -------------------------------------------------------------------------------
    // MARK: - Utils
    
    private func initView() {
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 300
        self.title = "cities".localized()
    }
    
    private func initModel() {
        do {
            try self.viewModel.readCities(fromFileName: "Cities", withFileExtension: "txt")
            self.tableView.reloadData()
        }
        catch {
            // In case of failure, show a simple message
            self.showError(withMessage: "csv_error".localized())
        }
    }
    
    //
    //
    // -------------------------------------------------------------------------------
    // MARK: - TableView
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell") as! CityInfoTableViewCell
        cell.setup(with: viewModel.city(at: indexPath.row))
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel.selectedCity = self.viewModel.city(at: indexPath.row)
        self.performSegue(withIdentifier: "ShowCityDetails", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

private extension CityInfoTableViewCell {
    func setup(with city: City?) {
        let noDataString = "no_data".localized()
        if let city = city {
            self.cityImage?.kf.setImage(with: city.imageUrl, placeholder: UIImage(named: "Placeholder"), options: nil, progressBlock: nil, completionHandler: { (image, error, cacheType, url) in
                // - Small issue with kingfisher for images in tableview cell, an layout update is needed after image download
                self.setNeedsLayout()
            })
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
