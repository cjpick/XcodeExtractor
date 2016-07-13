//
//  StoryboardPath.swift
//  XcodeExtractor
//
//  Created by Christopher Pick on 4/27/16.
//  Copyright © 2016 Christopher Pick. All rights reserved.
//

import Foundation

struct StoryboardPath: PathTraveler {
    
    let arguments:Arguments
    
    init(arg:Arguments) {
        arguments = arg
    }
    
    func walk() {
        print("Storyboard Path")
        let finder = FileFinder(directory: arguments.workingDir, pathExtension:"storyboard").find()
        
        var data = SegueData()
        for found in finder {
            let parser = StoryboardParser(path: found)
            data.append(parser.data)
        }
        if data.numberOfControllers > 0 {
            let handler = SegueHandlerTypeCreator(data: data)
            let createFile = CreateFile(arguments: arguments)
            createFile.create("SegueHandlerType", data: handler.fileData())
        }
    }
}

struct SegueData {
    private var data = [String:[String]]()
    
    var numberOfControllers: Int { return data.count }
    var controllers:[String] {
        var controllers = [String]()
        for (controller, _) in data {
            controllers.append(controller)
        }
        return controllers
    }
    
    func seguesFor(_ controller:String)->[String] {
        return data[controller] ?? []
    }
    
    mutating func add(_ controller:String, segue:String) {
        if (data[controller] != nil) {
            data[controller]?.append(segue)
        } else {
            data[controller] = [segue]
        }
        
    }
    
    mutating func append(_ additionalData:SegueData) {
        for (controller, segues) in additionalData.data {
            for segue in segues {
                add(controller, segue: segue)
            }
        }
    }
}



