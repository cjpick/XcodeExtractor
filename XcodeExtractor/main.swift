//
//  main.swift
//  XcodeExtractor
//
//  Created by Christopher Pick on 4/27/16.
//  Copyright © 2016 Christopher Pick. All rights reserved.
//

import Foundation

var router = Router(arg: Arguments())
router.add(traveler: StoryboardPath())
router.add(traveler: HelpPath(router: router))
router.route()

