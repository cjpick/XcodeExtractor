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
            case .Help:
                HelpPath(arg: arguments).walk()
            case .Storyboard:
                StoryboardPath(arg: arguments).walk()
            }
        }
    }
    
}
