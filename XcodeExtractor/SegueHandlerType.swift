//
//  SegueHandlerType.swift
//  XcodeExtractor
//
//  Created by Christopher Pick on 5/2/16.
//  Copyright © 2016 Christopher Pick. All rights reserved.
//

import Foundation


struct SegueHandlerTypeCreator {
    
    let data:SegueData
    
    init(data:SegueData) {
        self.data = data
    }
    
    func fileData()->String {
        var fileContent = ""
        fileContent += segueHandlerType()
        fileContent += controllerExtensions()
        return fileContent
    }
    
    func segueHandlerType()->String {
        var handler = ""
        handler += "//" + String.newLine()
        handler += "//  SegueHandlerType.swift" + String.newLine()
        handler += "//  Automatically built by XcodeExtractor" + String.newLine()
        handler += "//" + String.newLine()
        handler += String.newLine()
        
        handler += "import UIKit\n"
        handler += String.newLine()
        
        handler += "public protocol SegueHandlerType {\n"
        handler += "    associatedtype SegueIdentifier: RawRepresentable\n"
        handler += "}\n"
        handler += String.newLine()
        
        handler += "extension SegueHandlerType where Self: UIViewController, SegueIdentifier.RawValue == String {\n"
            
        handler += "    public func performSegueWithIdentifier(segueIdentifier: SegueIdentifier, sender: AnyObject?) {\n"
        handler += "        performSegueWithIdentifier(segueIdentifier.rawValue, sender: sender)\n"
        handler += "    }\n"
            
        handler += "    public func segueIdentifierForSegue(segue: UIStoryboardSegue) -> SegueIdentifier {\n"
        handler += "        guard let identifier = segue.identifier, segueIdentifier = SegueIdentifier(rawValue: identifier)\n"
        handler += "            else { fatalError(\"Invalid segue identifier \\(segue.identifier).\") }\n"
        handler += "        return segueIdentifier\n"
        handler += "    }\n"
        handler += "}"
        handler += String.newLine() + String.newLine()
        
        return handler
    }
    
    func controllerExtensions()->String {
        var extensions = ""
        for controller in data.controllers.sorted() {
            extensions += "extension \(controller):SegueHandlerType {\n"
            extensions += "    enum SegueIdentifier:String {\n"
            for segue in data.seguesFor(controller) {
                extensions += "        case \(segue.convertedSegueToCase())) = \"\(segue)\"\n"
            }
            extensions += "    }\n"
            extensions += "}\n\n"
            

        }
        return extensions
    }
}



