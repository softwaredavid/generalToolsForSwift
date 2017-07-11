//
//  UserDefault+Excention.swift
//  CodeProject
//
//  Created by Apple on 2017/7/11.
//  Copyright © 2017年 WangDaoLeTu. All rights reserved.
/////

import Foundation

protocol UserDefaultNameSpace { }

extension UserDefaultNameSpace {
    
    static func namespace<T>(_ key:T) -> String where T :RawRepresentable {
        return "\(Self.self).\(key.rawValue) "
    }
    
}

protocol UserDefaultSettable : UserDefaultNameSpace {
    
    associatedtype UserDefaultKey : RawRepresentable
    
}

extension UserDefaultSettable where UserDefaultKey.RawValue == String {}

extension UserDefaultSettable {
    
    /// 关于 Int 类型存储和读取
    static func set(value:Int, forKey key:UserDefaultKey){
        let key = namespace(key)
        UserDefaults.standard.set(value, forKey: key)
    }
    
    static func integer(forKey key:UserDefaultKey) -> Int {
        let key = namespace(key)
        return UserDefaults.standard.integer(forKey: key)
    }
    
    /// 关于 String 类型存储和读取
    static func set(value:Any?, forKey key:UserDefaultKey){
        let key = namespace(key)
        UserDefaults.standard.set(value, forKey: key)
    }
    
    static func string(forKey key:UserDefaultKey) -> String? {
        let key = namespace(key)
        return UserDefaults.standard.string(forKey: key)
    }
}

extension UserDefaults {
    
    /*! 关于账号的信息 Key 都放在这里 */
    struct Account: UserDefaultSettable {
        enum UserDefaultKey : String {
            case name
            case age
            case birth
        }
    }
    
    /*! 关于登陆情况 Key 都放在这里 */
    struct LoginStatus: UserDefaultSettable {
        enum UserDefaultKey:String {
            case lastLoginTime
            case sessionTime
        }
    }
}
