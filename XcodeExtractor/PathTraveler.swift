//
//  PathTraveler.swift
//  XcodeExtractor
//
//  Created by Christopher Pick on 4/27/16.
//  Copyright © 2016 Christopher Pick. All rights reserved.
//

import Foundation

protocol PathTraveler {
    
    var arguments:Arguments { get }
    
    func walk()
}

