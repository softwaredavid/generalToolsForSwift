//
//  CheckAppVersion.swift
//  CodeProject
//
//  Created by Apple on 2017/6/26.
//  Copyright © 2017年 WangDaoLeTu. All rights reserved.
//

import UIKit

class CheckAppVersion: NSObject {
    
    // MARK: == 得到当前App的版本
    static func getCurentAppVersion() -> String {
        return "\(Bundle.main.infoDictionary!["CFBundleShortVersionString"]!)"
    }
    
    // MARk: ==  版本升级
    static func upgradeApp(complete: @escaping ((String?, Bool)->Void)) {
        AppNet.post(url: appStoreUrl,header: ["Content-Type":"application/json"]) { (dic, any) in
            guard let result = dic?["results"] as? [[String:Any]] else { return }
            if result.count > 0 {
                var releaseNotes = ""
                if let str = result[0]["releaseNotes"] as? String {
                    releaseNotes = str
                }
                let v = getCurentAppVersion()
                let appStor = "\(String(describing: result[0]["version"]!))"
                
                if Int(v.replacingOccurrences(of: ".", with: ""))! < Int(appStor.replacingOccurrences(of: ".", with: ""))! {
                    complete(releaseNotes, true)
                } else {
                    complete(nil, false)
                }
            }
        }
    }
}
