//
//  FileFinder.swift
//  XcodeExtractor
//
//  Created by Christopher Pick on 4/27/16.
//  Copyright © 2016 Christopher Pick. All rights reserved.
//

import Foundation

struct FileFinder {
    
    let directory:NSURL
    let pathExtension:String
    
    init(directory:NSURL, pathExtension:String) {
        self.directory = directory
        self.pathExtension = pathExtension
    }
    
    func find()->[NSURL] {
        let localFileManager = NSFileManager()
        let directoryEnumerator = localFileManager.enumeratorAtURL(directory, includingPropertiesForKeys: [], options: [.SkipsHiddenFiles], errorHandler: nil)!
        
        var fileURLs: [NSURL] = []
        for case let fileURL as NSURL in directoryEnumerator {
            if pathExtension == fileURL.pathExtension {
                fileURLs.append(fileURL)
            }
        }
        return fileURLs
    }
    
}