//
//  NewCarViewController.swift
//  SQLiteIntro
//
//  Created by Marco Rodriguez on 2/13/19.
//  Copyright © 2019 MadDevelopers. All rights reserved.
//

import UIKit

class NewCarViewController: UIViewController {

    @IBOutlet weak var txtModel: UITextField!
    
    @IBOutlet weak var txtPrice: UITextField!
    
    let dbHelperObject = DataBaseHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dbHelperObject.startConnection()
    }

    @IBAction func saveCar(_ sender: UIButton) {
        if self.validateFields() {
            self.dbHelperObject.saveCar(model: self.txtModel.text!, price: Double(self.txtPrice.text!)!)
            self.present(self.dbHelperObject.alert!, animated: true, completion: nil)
            self.clearData()
        } else {
            print("The car data can't be empty")
        }
    }
    
    func validateFields() -> Bool {
        return self.txtModel.hasText && (self.txtPrice.hasText && Double(self.txtPrice.text!) != nil)
    }
    
    func clearData() {
        self.txtModel.text = ""
        self.txtPrice.text = ""
    }
}
