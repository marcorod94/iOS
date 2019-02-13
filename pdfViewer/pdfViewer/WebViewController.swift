//
//  WebViewController.swift
//  pdfViewer
//
//  Created by Marco Rodriguez on 2/12/19.
//  Copyright © 2019 MadDevelopers. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    @IBOutlet var webView: WKWebView!
    
    var fileName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showPDF()
    }
    
    //Method that loads the data from a file
    func showPDF() {
        do {
            let pdfDir = URL(fileURLWithPath: Bundle.main.path(forResource: self.fileName, ofType: "pdf")!)
            let pdfData = try Data(contentsOf: pdfDir)
            self.webView.load(pdfData, mimeType: "application/pdf", characterEncodingName: "utf-8", baseURL: pdfDir)
            
        } catch {
            print("An error had ocurred: \(error)")
        }
    }

}
