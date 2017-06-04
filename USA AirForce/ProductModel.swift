//
//  ProductModel.swift
//  USA AirForce
//
//  Created by Anuraag Jain on 21/05/17.
//  Copyright © 2017 app. All rights reserved.
//

import Foundation
typealias JSON = [String:AnyObject]
class ProductModel:NSObject{
    var title:String?
    var content = [DetailModel]()
    
    class func loadContent() -> [ProductModel]{
        var model = [ProductModel]()
        let path = Bundle.main.url(forResource: "uniform", withExtension: "json")
        do{
            let jsonData = try Data(contentsOf: path!)
            let jsonResult = try JSONSerialization.jsonObject(with: jsonData, options: [])
            let jsonArray = jsonResult as? NSArray
            for array in jsonArray!{
                let object = ProductModel()
                let array = array as? JSON
                object.title = array?["type"] as? String
                for content in array?["content"] as! NSArray{
                    let content = content as? JSON
                    let dObj = DetailModel()
                    dObj.content = content?["content"] as? String
                    dObj.header = content?["title"] as? String
                    object.content.append(dObj)
                }
                model.append(object)
            }
            return model
        }
        catch{
            print(error.localizedDescription)
            return model
        }
    }
}

class DetailModel:NSObject{
    var content:String?
    var header:String?
}

