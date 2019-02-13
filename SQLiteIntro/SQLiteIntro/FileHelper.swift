//
//  FileHelper.swift
//  SQLiteIntro
//
//  Created by Marco Rodriguez on 2/13/19.
//  Copyright © 2019 MadDevelopers. All rights reserved.
//

import Foundation

class FileHelper {
    let fileManagerObject = FileManager.default
    
    func documentFolderPath() -> String {
        return NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0]
    }
    
    func fileInDocumentFolderPath(fileName: String) -> String {
        return (self.documentFolderPath() as NSString).appendingPathComponent(fileName)
    }
    
    func existsFileInDocumentFolder(fileName: String) -> Bool {
        var exists:Bool = false
        if (fileManagerObject.fileExists(atPath: self.fileInDocumentFolderPath(fileName: fileName))) {
            exists = true
        }
        return exists
    }
    
    func dataBaseInBundlePath(dataBaseName: String) -> String {
        return Bundle.main.path(forResource: dataBaseName, ofType: "sqlite")!
    }
    
    func existsDataBaseInBundle(dataBasename: String) -> Bool {
        var exists:Bool = false
        if((Bundle.main.path(forResource: dataBasename, ofType: "sqlite")) != nil) {
            exists = true
        }
        return exists
    }
    
}
