//
//  StoryboardParser.swift
//  XcodeExtractor
//
//  Created by Christopher Pick on 5/2/16.
//  Copyright © 2016 Christopher Pick. All rights reserved.
//

import Foundation


enum Element {
    case segue(String)
    case viewController(String)
    case unknown
}

extension Element {
    
    init(element:String, attributes:[String:String]) {
        self = Element.createViewController(element: element, attributes: attributes) ?? Element.createSegue(element: element, attributes: attributes) ?? .unknown
        
//        switch(element, attributes["sceneMemberID"], attributes["customClass"], attributes["identifier"]) {
//        case ("segue", _, _, let id):
//            if let segueId = id {
//                self = .segue(segueId)
//                return
//            }
//        case (_, "viewController"?, let custom, _):
//            if let customClass = custom {
//                self = .viewController(customClass)
//                return
//            }
//        default:
//            break
//        }
//        self = .unknown
    }
    
    static func createViewController(element:String, attributes:[String:String])->Element? {
        if let customClass = attributes["customClass"] where attributes["sceneMemberID"] == "viewController" {
            return .viewController(customClass)
        }
        return nil
    }
    
    static func createSegue(element:String, attributes:[String:String])->Element? {
        if let id = attributes["identifier"] where element == "segue" {
            return .segue(id)
        }
        return nil
    }
    
}

class StoryboardParser:NSObject, XMLParserDelegate {
    
    var data = SegueData()
    private var currentViewController:String = ""
    
    let parser:XMLParser
    
    init(path:URL) {
        let data = try! Data(contentsOf: path)
        parser = XMLParser(data: data)
        super.init()
        
        parser.delegate = self
        parser.parse()
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName Name: String?, attributes attributeDict: [String : String]) {
        let element = Element(element: elementName, attributes: attributeDict)
        switch(element) {
        case .segue(let name):
            data.add(currentViewController, segue: name)
        case .viewController(let name):
            currentViewController = name
        case .unknown:
            break
        }
    }
}

