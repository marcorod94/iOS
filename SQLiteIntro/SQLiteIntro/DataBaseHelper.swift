//
//  DataBaseHelper.swift
//  SQLiteIntro
//
//  Created by Marco Rodriguez on 2/13/19.
//  Copyright © 2019 MadDevelopers. All rights reserved.
//
import UIKit
import Foundation

class DataBaseHelper {
    let fileHelperObject = FileHelper()
    var dataDabeObject: FMDatabase? = nil
    var alert: UIAlertController? = nil
    
    func startConnection() {
        dataDabeObject = FMDatabase(path: fileHelperObject.fileInDocumentFolderPath(fileName: "carDB"))
    }
    
    func findCarPriceByModel(model: String) {
        do {
            dataDabeObject?.open()
            var price: Double?
            let query = "select price from car where model = '"+model+"'"
            let results:FMResultSet? = try dataDabeObject!.executeQuery(query, values: nil)
            while results!.next() {
                price = results?.double(forColumn: "price")
            }
            self.showSuccess(message: "The price of the car is \(price!)")
            dataDabeObject?.close()
        } catch {
            print("An error has ocurred while searching prices")
        }
    }
    
    func saveCar(model: String, price: Double) {
        do {
            dataDabeObject?.open()
            let query = "insert into car (model, price) values ('\(model)', \(price))"
            try dataDabeObject!.executeUpdate(query, values: nil)
            self.showSuccess(message: "The car was successfully saved")
            dataDabeObject?.close()
        } catch {
            print("An error has ocurred while saving car")
        }
    }
    
    func showSuccess(message: String) {
        self.alert = UIAlertController(title: "Success", message: message, preferredStyle: .alert)
        self.alert!.addAction(UIAlertAction(title: "Continue", style: .cancel, handler: nil))
    }
}
