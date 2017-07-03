//
//  AppSession.swift
//  USA AirForce
//
//  Created by Anuraag Jain on 22/05/17.
//  Copyright © 2017 app. All rights reserved.
//

import Foundation

class AppSession:NSObject{
    static let shared = AppSession()
    var uniformContent:[Section]{
        var s = Section.loadContent()
        return s
    }
}
