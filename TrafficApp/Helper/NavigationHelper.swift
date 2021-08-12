//
//  NavigationHelper.swift
//  TrafficApp
//
//  Created by Leon on 23/7/21.
//

import Foundation
import UIKit

class NavigationHelper {
    static let MAIN_STORYBOARD = "Main"
    
    class func getViewController(_ storyboardName: String, _ identifier: String) -> UIViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let destViewController : UIViewController = storyboard.instantiateViewController(withIdentifier: identifier)
        
        destViewController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        destViewController.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        
        return destViewController
    }
}
