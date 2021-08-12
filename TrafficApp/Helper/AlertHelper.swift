//
//  AlertHelper.swift
//  TrafficApp
//
//  Created by Leon on 23/7/21.
//

import Foundation
import UIKit

class AlertHelper {
    func displayError(errorMessage: String, controller: UIViewController) {
        let title = "Error"
        
        let alert = UIAlertController(title: title, message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        
        DispatchQueue.main.async {
            controller.present(alert, animated: true, completion: nil)
        }
    }
}
