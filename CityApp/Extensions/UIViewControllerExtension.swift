//
//  UIViewControllerExtension.swift
//  TripAdvisor Cities
//
//  Created by Adrian Zghibarta on 12/6/18.
//  Copyright © 2018 Adrian Zghibarta. All rights reserved.
//

import UIKit

extension UIViewController {
    
    
    /// Shows an UIAlertController with default "error_title" and custom message
    ///
    /// - Parameter message: message that will be shown in the error
    func showError(withMessage message: String) {
        let alertController = UIAlertController(title: "error_title".localized(), message: message, preferredStyle: UIAlertController.Style.alert)
        let cancelAction = UIAlertAction(title: "ok".localized(), style: UIAlertAction.Style.cancel)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
