//
//  ProductModel.swift
//  USAF DA
//
//  Created by Bryan Allebone on 03/07/17.
//  Copyright © 2017 kdidigital.com. All rights reserved.
//

import Foundation
import Decodable

class Section: Decodable {
    var display: String
    var description: String?
    var subSections: [Section]?
    
    required init(_ display: String, subSections: [Section]? = nil, description: String? = nil) {
        self.display = display
        self.subSections = subSections
        self.description = description
    }
    
    static func decode(_ j: Any) throws -> Self {
        let section = self.init(try j => "display")
        section.subSections = try j =>? "sections"
        section.description = try j =>? "description"
        return section
    }
    
    class func loadContent() -> [Section]{
        let path = Bundle.main.url(forResource: "uniforms2", withExtension: "json")
        do{
            let data = try Data(contentsOf: path!)
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            let section = try [Section].decode(json)
            return section
        }
        catch{
            print(error.localizedDescription)
            return []
        }
    }
}
