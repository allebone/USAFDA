//
//  AppSession.swift
//  USAF DA
//
//  Created by Bryan Allebone on 03/07/17.
//  Copyright © 2017 kdidigital.com. All rights reserved.
//

import Foundation

class AppSession:NSObject{
    static let shared = AppSession()
    var uniformContent:[ProductModel]{
        return ProductModel.loadContent()
    }
}
