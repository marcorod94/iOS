//
//  TableViewController.swift
//  pdfViewer
//
//  Created by Marco Rodriguez on 2/12/19.
//  Copyright © 2019 MadDevelopers. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var pdfsNameArray: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pdfsNameArray = ["pdf_1","pdf_2","pdf_3", "pdf_4","pdf_5","pdf_6", "pdf_7","pdf_8","pdf_9"]
    }
    
    //Method that defines the number of sections in the tableView
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Method that defines the number of rows in section for the tableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pdfsNameArray.count
    }
    
    //Method that defines the content of each cell of teh tableView
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel!.text = self.pdfsNameArray[indexPath.row]
        cell.imageView!.image = UIImage(named: "Libro.jpg")
        return cell
    }
    
    //Method that take place when a row is selected it will call the next view
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "viewPDF", sender: indexPath.row)
    }
    
    //Method that prepares transition to the next view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let webViewObject: WebViewController = segue.destination as! WebViewController
        webViewObject.fileName = self.pdfsNameArray[sender as! Int]
        
    }
 
 }
