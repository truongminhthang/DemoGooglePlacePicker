//
//  ViewController.swift
//  DemoGoogleMap
//
//  Created by Minh.Thang on 3/26/19.
//  Copyright © 2019 Minh.Thang. All rights reserved.
//

import UIKit

import GooglePlacePicker

class ViewController: UIViewController, GMSPlacePickerViewControllerDelegate {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // The code snippet below shows how to create and display a GMSPlacePickerViewController.
    @IBAction func pickPlace(_ sender: UIButton) {
        let config = GMSPlacePickerConfig(viewport: nil)
        let placePicker = GMSPlacePickerViewController(config: config)
        placePicker.delegate = self
        present(placePicker, animated: true, completion: nil)
    }
    
    // To receive the results from the place picker 'self' will need to conform to
    // GMSPlacePickerViewControllerDelegate and implement this code.
    func placePicker(_ viewController: GMSPlacePickerViewController, didPick place: GMSPlace) {
        // Dismiss the place picker, as it cannot dismiss itself.
        viewController.dismiss(animated: true, completion: nil)
        
        nameLabel.text = place.name
        addressLabel.text = place.formattedAddress     
    }
    
    func placePickerDidCancel(_ viewController: GMSPlacePickerViewController) {
        // Dismiss the place picker, as it cannot dismiss itself.
        viewController.dismiss(animated: true, completion: nil)
        
        print("No place selected")
    }

}

