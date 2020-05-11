//
//  CustomerIDViewController.swift
//  Random
//
//  Created by Eisuke Tamatani on 5/6/20.
//  Copyright © 2020 Eisuke. All rights reserved.
//

import UIKit
import Foundation
import FirebaseStorage
import FirebaseDatabase
import FirebaseAuth

class CustomerIDViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var customerId: UITextField!
    var drink:posItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customerId.delegate = self
    }

    @IBAction func continueTapped(_ sender: Any) {
        setPurchase()
        dismiss(animated: true, completion: nil)
    }
    
    func setPurchase() {
        
        let ref = Database.database().reference()

        // Create a dictionry for the item
        let itemData = ["itemName":drink!.itemName,"itemImageUrl":drink!.itemImageUrl, "YTLink":drink!.videoLink,"description":drink!.description]
        
        
        print(customerId.text!)
        // Create the profile for the user id
        ref.child("consumers").child(customerId.text!).child("purchasedItems").childByAutoId().setValue(itemData) { (error, ref) in
        }
    }
}
