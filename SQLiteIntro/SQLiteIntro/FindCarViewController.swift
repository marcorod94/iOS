//
//  FindCarViewController.swift
//  SQLiteIntro
//
//  Created by Marco Rodriguez on 2/13/19.
//  Copyright © 2019 MadDevelopers. All rights reserved.
//

import UIKit

class FindCarViewController: UIViewController {

    @IBOutlet weak var txtModel: UITextField!
    
    @IBOutlet weak var lblPrice: UILabel!
    
    let dbHelperObject = DataBaseHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dbHelperObject.startConnection()
    }

    @IBAction func findCar(_ sender: UIButton) {
        if self.txtModel.hasText {
            self.dbHelperObject.findCarPriceByModel(model: self.txtModel.text!)
            self.present(self.dbHelperObject.alert!, animated: true, completion: nil)
        } else {
            print("The model can't be empty")            
        }
    }
}
