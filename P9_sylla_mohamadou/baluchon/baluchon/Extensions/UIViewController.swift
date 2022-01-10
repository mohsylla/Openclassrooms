//
//  UIViewController.swift
//  Baluchon
//
//  Created by Sylla on 14/12/2021.
//


import UIKit

extension UIViewController {
    
    // MARK: - Methods
    
    /// method to display an alert
    func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style:.default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
    /// convert the received parameter to a string
    func convertToString(value: Float) -> String {
        return String(value)
    }
    
    /// method called to manage button and activity controller together: true to hide button and show acticity indicator / false to show button and hide activity controller
    func activityIndicator(activityIndicator: UIActivityIndicatorView, button: UIButton, showActivityIndicator: Bool){
        activityIndicator.isHidden = !showActivityIndicator
        button.isHidden = showActivityIndicator
    }
}
