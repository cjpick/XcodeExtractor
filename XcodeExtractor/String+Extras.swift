//
//  String+Extras.swift
//  XcodeExtractor
//
//  Created by Christopher Pick on 7/12/16.
//  Copyright © 2016 Christopher Pick. All rights reserved.
//

import Foundation

public extension String {
    
    public static func newLine()->String {
        return "\n"
    }
    
    func lowercasedFirstLetter() -> String {
        let first = String(characters.prefix(1)).lowercased()
        let other = String(characters.dropFirst())
        return first + other
    }
    
    mutating func lowercaseFirstLetter() {
        self = lowercasedFirstLetter()
    }
    
    mutating func lowercase() {
        self = lowercased()
    }
    
    mutating func capitalize() {
        self = capitalized
    }
    
    func stripedSpaces()->String {
        return replacingOccurrences(of: " ", with: "")

    }
    
    mutating func stripSpaces() {
        self = stripedSpaces()
    }
    
    func convertedSegueToCase()->String {
        var temp = self
        temp.lowercase()
        temp.capitalize()
        temp.lowercaseFirstLetter()
        temp.stripSpaces()
        return temp
    }
    
    func startWithDash()->Bool {
        return String(characters.prefix(1)) == "-"
    }
    
}
