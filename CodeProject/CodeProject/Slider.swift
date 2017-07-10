//
//  Slider.swift
//  CodeProject
//
//  Created by Apple on 2017/7/10.
//  Copyright © 2017年 WangDaoLeTu. All rights reserved.
//

import UIKit

class Slider: HandyJSON {
    
    
    var id: String?
    var action: String?
    var target: String?
    var paramsJson: String?
    var name: String?
    var imageUrl: String?
    var intro: String?
    var order: String?
    public required init() {}

}
class F: HandyJSON {
    
    var sliders: [Slider]?
    public required init() {}
}
