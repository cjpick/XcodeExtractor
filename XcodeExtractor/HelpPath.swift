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
    
    init(arguments: Arguments) {
        self.arguments = arguments
    }
    
    func walk() {
        print(help())
    }
    
    func help()->String {
        var helpText = ""
        helpText += "Extends the controllers to use an enum of the segues in the storyboards. \n\n"
        
        for switches in SwitchSettings.allSwitchSettings() {
            helpText += switches.longDescription + "\n"
        }
//        
//        helpText += "  -d, --dest: the directory to tore the segue file within.\n"
//        helpText += "  -h,--help: the help information.\n"
//        helpText += "  -s, --segue: perform the search for segues.\n"
//        helpText += "  -p, --path: the path to perform the search upon.\n"
        
        return helpText
    }
    
}
