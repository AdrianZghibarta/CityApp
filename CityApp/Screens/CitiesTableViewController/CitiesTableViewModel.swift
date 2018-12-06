//
//  CitiesTableViewModel.swift
//  TripAdvisor Cities
//
//  Created by Adrian Zghibarta on 12/6/18.
//  Copyright © 2018 Adrian Zghibarta. All rights reserved.
//

import UIKit

enum CitiesTableViewModelError: Error {
    case invalidFile
}

class CitiesTableViewModel: CitiesTableViewModelProtocol {
    
    //
    //
    // -------------------------------------------------------------------------------
    // MARK: - Properties
    
    private var cities: [City] = []
    var selectedCity: City? = nil
    
    //
    //
    // -------------------------------------------------------------------------------
    // MARK: - Protocol implementations
    
    
    /// Reads the content of CSV file and maps the values to an array of Cities
    ///
    /// - Parameters:
    ///   - fileName: CSV file name
    ///   - fileExtension: CSV file extension
    /// - Throws: CitiesTableViewModelError
    func readCities(fromFileName fileName: String, withFileExtension fileExtension: String) throws {
        if let filePath = Bundle.main.url(forResource: fileName, withExtension: fileExtension) {
            let fileContent = try String(contentsOf: filePath)
            
            let csvData = CSwiftV(with: fileContent)
            
            var allRows: [[String]] = []
            if (csvData.headers.count > 0) {
                allRows.append(csvData.headers)
            }
            allRows.append(contentsOf: csvData.rows)
            
            self.cities = allRows.map {City(
                withName: self.getProperty(forIndex: 0, fromProperties: $0),
                country: self.getProperty(forIndex: 1, fromProperties: $0),
                imageUrlString: self.getProperty(forIndex: 2, fromProperties: $0),
                information: self.getProperty(forIndex: 3, fromProperties: $0)
            )}
        }
        else {
            throw CitiesTableViewModelError.invalidFile
        }
    }
    
    func numberOfRowsInSection() -> Int {
        return self.cities.count;
    }
    
    func city(at index: Int) -> City? {
        return self.cities.count > index ? self.cities[index] : nil
    }
    
    //
    //
    // -------------------------------------------------------------------------------
    // MARK: - Utils
    
    
    /// Gets a city property at given index in the array of row properties extracted from CSV
    ///
    /// - Parameters:
    ///   - index: index in the CSV row values
    ///   - properties: current CSV row values
    /// - Returns: the value at given CSV row index
    private func getProperty(forIndex index: Int, fromProperties properties: [String]) -> String? {
        return properties.count >= (index + 1) ? properties[index] : nil
    }
}
