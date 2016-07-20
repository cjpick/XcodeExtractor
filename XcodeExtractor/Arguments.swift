//
//  Arguments.swift
//  XcodeExtractor
//
//  Created by Christopher Pick on 4/27/16.
//  Copyright © 2016 Christopher Pick. All rights reserved.
//

import Foundation

struct Arguments {
    var argumentPairs: [String:String]
    var workingDir:URL {
        return URL(fileURLWithPath: argumentPairs["-dest"]!)
    }
    var searchDir:URL {
        return URL(fileURLWithPath: argumentPairs["-search"]!)
    }
    
    init() {
        var tempArgs = [String:String]()
        var i = 1
        let args = Process.arguments
        while i < args.count {
            if args[i].startWithDash() {
                if args[i+1].startWithDash() {
                    tempArgs[args[i]] = ""
                } else {
                    tempArgs[args[i]] = args[i+1]
                    i += 1
                }
            }
            i += 1
        }
        
        
        // Setup Directories
        
        if tempArgs["-search"] == nil {
            tempArgs["-search"] = ProcessInfo.processInfo.environment["PWD"]
        }
        
        if tempArgs["-dest"] == nil {
            tempArgs["-dest"] = ProcessInfo.processInfo.environment["PWD"]
        }
        
        self.argumentPairs = tempArgs
    }
}
