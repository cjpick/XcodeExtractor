//
//  Element.swift
//  XcodeExtractor
//
//  Created by Christopher Pick on 7/19/16.
//  Copyright © 2016 Christopher Pick. All rights reserved.
//

import Foundation


public enum Element {
    case segue(String)
    case viewController(String)
    case unknown
}

extension Element {
    
    public init(element:String, attributes:[String:String]) {
        self = Element.createViewController(element: element, attributes: attributes) ?? Element.createSegue(element: element, attributes: attributes) ?? .unknown
    }
    
    private static func createViewController(element:String, attributes:[String:String])->Element? {
        if let customClass = attributes["customClass"] , attributes["sceneMemberID"] == "viewController" {
            return .viewController(customClass)
        }
        return nil
    }
    
    private static func createSegue(element:String, attributes:[String:String])->Element? {
        if let id = attributes["identifier"] , element == "segue" {
            return .segue(id)
        }
        return nil
    }
    
}
