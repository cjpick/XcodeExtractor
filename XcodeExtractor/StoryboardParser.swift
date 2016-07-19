//
//  StoryboardParser.swift
//  XcodeExtractor
//
//  Created by Christopher Pick on 5/2/16.
//  Copyright © 2016 Christopher Pick. All rights reserved.
//

import Foundation


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

