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
    static func verifyText(regular: String, text: String) -> Bool {
        let b = NSPredicate(format: "SELF MATCHES %@", regular)
        return b.evaluate(with: text)
    }
    // MARK: ---------拨打电话
    static func callPhone(phone: String) {
        let web = UIWebView()
        let str = "tel:" + phone
        let urlRequest = URLRequest(url: URL(string: str)!)
        web.loadRequest(urlRequest as URLRequest)
        UIApplication.shared.keyWindow?.addSubview(web)
    }
    // MARK: ---------富文本
}
