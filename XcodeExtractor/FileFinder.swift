//
//  FileFinder.swift
//  XcodeExtractor
//
//  Created by Christopher Pick on 4/27/16.
//  Copyright © 2016 Christopher Pick. All rights reserved.
//

import Foundation

struct FileFinder {
    
    let directory:URL
    let pathExtension:String
    
    init(directory:URL, pathExtension:String) {
        self.directory = directory
        self.pathExtension = pathExtension
    }
    
    func find()->[URL] {
        let localFileManager = FileManager()
        let directoryEnumerator = localFileManager.enumerator(at: directory, includingPropertiesForKeys: [], options: [.skipsHiddenFiles], errorHandler: nil)!
        
        var fileURLs: [URL] = []
        for case let fileURL as URL in directoryEnumerator {
            if pathExtension == fileURL.pathExtension {
                fileURLs.append(fileURL)
            }
        }
        return fileURLs
    }
    
}
