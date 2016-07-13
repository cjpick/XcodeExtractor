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
        
        for path in arguments.paths {
            switch path {
            case .help:
                HelpPath(arg: arguments).walk()
            case .storyboard:
                StoryboardPath(arg: arguments).walk()
            }
        }
    }
    
}
