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
        print(help())
    }
    
    func help()->String {
        var helpText = ""
        helpText += "Extends the controllers to use an enum of the segues in the storyboards. \n\n"
        
        helpText += "  -d: the starting directory to perform the search upon and store the segue file within.\n"
        helpText += "  -h,--help: the help information.\n"
        helpText += "  -s: perform the search for segues.\n"
        
        return helpText
    }
    
}
