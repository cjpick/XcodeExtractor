//
//  PathTraveler.swift
//  XcodeExtractor
//
//  Created by Christopher Pick on 4/27/16.
//  Copyright © 2016 Christopher Pick. All rights reserved.
//

import Foundation

protocol PathTraveler {
    
    var hooks:[String] { get }
    var description:String { get }
    var arguments:Arguments! { set get }
    
    func walk()
}

