//
//  HelpPath.swift
//  XcodeExtractor
//
//  Created by Christopher Pick on 4/27/16.
//  Copyright © 2016 Christopher Pick. All rights reserved.
//

import Foundation

struct HelpPath: PathTraveler {
    
    let arguments:Arguments
    
    init(arg:Arguments) {
        arguments = arg
    }
    
    func walk() {
        print("Help me")
        // Create the help file
        // Print the help file out to the screen
    }
    
}
