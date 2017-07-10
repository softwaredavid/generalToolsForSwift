//
//  ConvertData.swift
//  CodeProject
//
//  Created by Apple on 2017/7/10.
//  Copyright © 2017年 WangDaoLeTu. All rights reserved.
//

import UIKit

struct ConvertData {
    static func convertModel(jsonData: NSDictionary, className: HandyJSON) -> HandyJSON? {
        let g = type(of: className).deserialize(from: jsonData)
        return g
    }
    
    static func convertModel(jsonData: String, className: HandyJSON) -> HandyJSON? {
        let g = type(of: className).deserialize(from: jsonData)
        return g
    }
    
    static func convertModel<T: HandyJSON>(jsonData: NSArray, className: T) -> [T]? {
        let g = [T].deserialize(from: jsonData)
        return g as? [T]
    }

}
