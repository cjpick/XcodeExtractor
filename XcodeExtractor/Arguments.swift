//
//  Arguments.swift
//  XcodeExtractor
//
//  Created by Christopher Pick on 4/27/16.
//  Copyright © 2016 Christopher Pick. All rights reserved.
//

import Foundation

struct SwitchSettings {
    let name:String
    let switches:[String]
    let description:String
    let command:Bool
    let hasSecondArgument:Bool
    
    var longDescription:String {
        return "  \(switches.joined(separator: ", ")): \(description)"
    }
}

extension SwitchSettings {
    
    func argumentSet(args:[String:String])->Bool {
        for eachSwitch in switches {
            if args[eachSwitch] != nil {
                return true
            }
        }
        return false
    }
    
    func string(within args:[String:String])->String {
        for eachSwitch in switches {
            if let value = args[eachSwitch] {
                return value
            }
        }
        return ""
    }
    
    func argumentValue(args:[String:String])->Bool {
        return argumentSet(args: args)
    }
    
    func argumentValue(args:[String:String])->String {
        guard let value:String = string(within: args), value != "" else {
            print("No value sent for the switch \(name)")
            exit(1)
        }
        return value
    }
    
    func argumentValue(args:[String:String])->URL {
        if argumentSet(args: args) {
            guard let url:String = argumentValue(args: args), url != "" else {
                print("Need a url for \(name) switch")
                exit(1)
            }
            return URL(fileURLWithPath: url)
        }
        return URL(fileURLWithPath: ProcessInfo.processInfo.environment["PWD"]!)
    }
    
    
}

extension SwitchSettings {
    
    static func destination()->SwitchSettings {
        return SwitchSettings(name: "destination", switches: ["-d", "--destination"], description: "the directory for all file to be created within.", command: false, hasSecondArgument: true)
    }
    
    static func help()->SwitchSettings {
        return SwitchSettings(name: "help", switches: ["-h", "--help"], description: "displays the list of commands", command: true, hasSecondArgument: false)
    }
    
    static func searchPath()->SwitchSettings {
        return SwitchSettings(name: "searchPath", switches: ["-p", "--path"], description: "the directory to start searching for the storyboards.", command: false, hasSecondArgument: true)
    }
    
    static func segue()->SwitchSettings {
        return SwitchSettings(name: "segue", switches: ["-s", "--segue"], description: "finds all the segues within the storyboards and creates the SegueHandlerType file.", command: true, hasSecondArgument: false)
    }
    
    static func allSwitchSettings()->[SwitchSettings] {
        return [SwitchSettings.destination(),SwitchSettings.help(),SwitchSettings.searchPath(), SwitchSettings.help()]
    }
}



struct Arguments {
    
    let help:Bool
    let segue:Bool
    let destination:URL
    let searchPath:URL
    
    
    var workingDir:URL {
        return destination
    }
    var searchDir:URL {
        return searchPath
    }
    
    init() {
        let args = Arguments.argsGatherer()
        
        help = SwitchSettings.help().argumentValue(args: args)
        segue = SwitchSettings.segue().argumentValue(args: args)
        destination = SwitchSettings.destination().argumentValue(args: args)
        searchPath = SwitchSettings.searchPath().argumentValue(args: args)
    }
    
    private static func argsGatherer()->[String:String] {
        var tempArgs = [String:String]()
        var i = 1
        let args = Process.arguments
        while i < args.count {
            if args[i].startWithDash() {
                if i+1 < args.count && !args[i+1].startWithDash() {
                    tempArgs[args[i]] = args[i+1]
                } else {
                    tempArgs[args[i]] = ""
                    i += 1
                }
            }
            i += 1
        }
        return tempArgs
    }
}
