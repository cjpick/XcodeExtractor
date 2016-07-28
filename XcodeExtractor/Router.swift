//
//  Router.swift
//  XcodeExtractor
//
//  Created by Christopher Pick on 4/27/16.
//  Copyright © 2016 Christopher Pick. All rights reserved.
//

import Foundation


struct Router {
    
    let arguments:Arguments
    
    init(arg:Arguments) {
        arguments = arg
    }
    
    func route() {
        if arguments.help {
            HelpPath(arguments:arguments).walk()
        }
        if arguments.segue {
            StoryboardPath(arguments:arguments).walk()
        }
    }
    
}
