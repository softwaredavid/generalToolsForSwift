//
//  AppUtil.swift
//  CodeProject
//
//  Created by Apple on 2017/7/3.
//  Copyright © 2017年 WangDaoLeTu. All rights reserved.
//

import UIKit

class AppUtil: NSObject {
    
    // MARK: ----- 验证某个字符是否符合某个规则
    func verifyText(regular: String, text: String) -> Bool {
        let b = NSPredicate(format: "SELF MATCHES %@", regular)
        return b.evaluate(with: text)
    }
}
