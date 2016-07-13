//
//  Arguments.swift
//  XcodeExtractor
//
//  Created by Christopher Pick on 4/27/16.
//  Copyright © 2016 Christopher Pick. All rights reserved.
//

import Foundation

enum Path {
    case help
    case storyboard
}

struct Arguments {
    let workingDir:URL
    let paths:[Path]
    
    init() {
        var directory:String = ""
        let args = ProcessInfo.processInfo.arguments
        var i = 1
        var tempPaths = [Path]()
        while i < args.count {
            switch args[i] {
            case "-d":
                i += 1
                directory = args[i]
            case "-s":
                tempPaths.append(Path.storyboard)
            case "-h":
                tempPaths.append(Path.help)
            case "--help":
                tempPaths.append(Path.help)
            default:
                print("Unknown: \(args[i]). Type XcodeExtracor -h for help.")
                exit(1)
            }
            i += 1
        }
        paths = tempPaths
        
        if directory == "" {
            self.workingDir = URL(fileURLWithPath: ProcessInfo.processInfo.environment["PWD"] ?? "")
        } else {
            self.workingDir = URL(fileURLWithPath: directory)
        }
        
    }
}
