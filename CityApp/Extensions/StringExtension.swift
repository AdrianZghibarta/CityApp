//
//  StringExtension.swift
//  TripAdvisor
//
//  Created by Adrian Zghibarta on 12/6/18.
//  Copyright © 2018 Adrian Zghibarta. All rights reserved.
//

import Foundation

extension String {
    
    
    /// Gets the localized string for current self value
    ///
    /// - Parameters:
    ///   - bundle: Bundle that will be used for localization
    ///   - tableName: Table name that will be used for localization
    /// - Returns: Localized string for current self value
    func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, value: "**\(self)**", comment: "")
    }
}


