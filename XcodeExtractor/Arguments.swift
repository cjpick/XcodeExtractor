//
//  Arguments.swift
//  XcodeExtractor
//
//  Created by Christopher Pick on 4/27/16.
//  Copyright © 2016 Christopher Pick. All rights reserved.
//

import Foundation

enum Path {
    case Help
    case Storyboard
}

struct Arguments {
    let workingDir:NSURL
    let paths:[Path]
    
    init() {
        var directory:String = ""
        let args = NSProcessInfo.processInfo().arguments
        var i = 1
        var tempPaths = [Path]()
        while i < args.count {
            switch args[i] {
            case "-d":
                i += 1
                directory = args[i]
            case "-s":
                tempPaths.append(Path.Storyboard)
            case "-h":
                tempPaths.append(Path.Help)
            case "--help":
                tempPaths.append(Path.Help)
            default:
                print("Unknown: \(args[i])")
            }
            i += 1
        }
        paths = tempPaths
        
        if directory == "" {
            self.workingDir = NSURL(fileURLWithPath: NSProcessInfo.processInfo().environment["PWD"] ?? "")
        } else {
            self.workingDir = NSURL(fileURLWithPath: directory)
        }
        
    }
}
