//
//  BasePara.swift
//  PartOfXib
//
//  Created by Apple on 2017/6/26.
//  Copyright © 2017年 WangDaoLeTu. All rights reserved.
//

import UIKit
//MARK: =========常用的定义===========
typealias void_func_void = () -> ()

//MARK: ========各种正则=========
let phone = "^[1][^129]{1}[0-9]{9}$"
let password = ""
let email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"

//MRAK: =====  屏幕的尺寸 ========
let screen_width = UIScreen.main.bounds.size.width
let screen_heigh = UIScreen.main.bounds.size.height

//MRAK: =====  沙盒存储 ========

let userDefault = UserDefaults.standard

