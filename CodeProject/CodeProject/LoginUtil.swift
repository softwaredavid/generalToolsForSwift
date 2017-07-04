//
//  LoginUtil.swift
//  CodeProject
//
//  Created by Apple on 2017/7/4.
//  Copyright © 2017年 WangDaoLeTu. All rights reserved.
//

import UIKit

class LoginUtil: NSObject {
    
    static func verifyLoginInfo(useName: String, pasword: String) -> Bool {
        
        if !AppUtil.verifyText(regular: phone, text: useName) {
            AlertView.show(text: "用户名不正确")
            return false
        }
        if !AppUtil.verifyText(regular: pasword, text: pasword) {
            AlertView.show(text: "密码不正确")
            return false
        }
        return true
    }
    
    static func login(success: @escaping (() -> ())) {//登录操作
    
    }
    
    static func getUserInfo() {//获取用户信息
    
    }
    
}
