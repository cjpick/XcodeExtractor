//
//  StoryboardParser.swift
//  XcodeExtractor
//
//  Created by Christopher Pick on 5/2/16.
//  Copyright © 2016 Christopher Pick. All rights reserved.
//

import Foundation


enum Elements:String {
    case Segue = "segue"
    case ViewController = "viewController"
    case TableViewCell = "tableViewCell"
    
    var identifier:String {
        switch self {
        case .Segue:
            return "identifier"
        case .ViewController:
            return "customClass"
        case .TableViewCell:
            return "reuseIdentifier"
        }
    }
    
}

class StoryboardParser:NSObject, NSXMLParserDelegate {
    
    var data = SegueData()
    private var currentViewController:String = ""
    
    let parser:NSXMLParser
    
    init(path:NSURL) {
        let data = NSData(contentsOfURL: path)!
        parser = NSXMLParser(data: data)
        super.init()
        
        parser.delegate = self
        parser.parse()
    }
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName Name: String?, attributes attributeDict: [String : String]) {
        if let element = Elements(rawValue: elementName) {
            switch element {
            case Elements.Segue:
                if let identifier = attributeDict[Elements.Segue.identifier] {
                    data.add(currentViewController, segue: identifier)
                    
                }
            case Elements.ViewController:
                if let controller = attributeDict[Elements.ViewController.identifier] {
                    currentViewController = controller
                }
            default:
                break
            }
        }
    }
}

