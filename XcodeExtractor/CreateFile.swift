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
    
    func create(_ fileName:String, data:String) {
        let url = try! arguments.destination.appendingPathComponent("\(fileName).swift")
        try! data.write(to: url, atomically: true, encoding:String.Encoding.ascii)
    }
    
}


