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
    var routes: [PathTraveler] = []
    
    init(arg:Arguments) {
        arguments = arg
    }
    
    func route() {
//        for var path in routes {
//            let compare = arguments.argumentPairs.filter { key, value in path.hooks.index(of: key) != nil }
//            if compare.count > 0 {
//                path.arguments = arguments
//                path.walk()
//            }
//        }
    }
    
    mutating func add(traveler: PathTraveler) {
        routes.append(traveler)
    }
    
}
