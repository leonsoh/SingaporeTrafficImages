//
//  CustomAlertViewController.swift
//  TrafficApp
//
//  Created by Leon on 23/7/21.
//

import UIKit

class CustomAlertViewController: UIViewController {
   
    @IBOutlet weak var parentContainerView: UIView!
    @IBOutlet weak var imageContainerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var buttonContainerVIew: UIView!
    @IBOutlet weak var dismissButton: UIButton!
    
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 1, alpha: 0.5)
        imageView.contentMode = .scaleToFill
        imageView.image = image
        
    }
    
    @IBAction func didTapDismissButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
