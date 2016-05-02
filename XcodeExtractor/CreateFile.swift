//
//  CreateFile.swift
//  XcodeExtractor
//
//  Created by Christopher Pick on 5/2/16.
//  Copyright © 2016 Christopher Pick. All rights reserved.
//

import Foundation

struct CreateFile {
    
    let arguments: Arguments
    
    init(arguments: Arguments) {
        self.arguments = arguments
    }
    
    func create(fileName:String, data:String) {
        let url = arguments.workingDir.URLByAppendingPathComponent("\(fileName).swift")
        try! data.writeToURL(url, atomically: true, encoding:NSASCIIStringEncoding)
    }
    
}


