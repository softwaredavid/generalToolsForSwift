//
//  CheckAppVersion.swift
//  CodeProject
//
//  Created by Apple on 2017/6/26.
//  Copyright © 2017年 WangDaoLeTu. All rights reserved.
//

import UIKit
fileprivate let versionApp = "SnadbosVersion"

class CheckAppVersion: NSObject {
    
    // MARK: == 得到当前App的版本
    static func getCurentAppVersion() -> String {
        return "\(Bundle.main.infoDictionary!["CFBundleShortVersionString"]!)"
    }
    
   /* 不够精确 // MARK: == 本地版本
    static func isNeewVersion() -> Bool {
        let currentVersion = getCurentAppVersion()
        let userDefault = UserDefaults.standard
        let sanboxVersion = userDefault.string(forKey: versionApp) ?? "0.0"
        if currentVersion > sanboxVersion {
            
            userDefault.set(currentVersion, forKey: versionApp)
            return true
        }
        return false
    }*/
    
    // MARk: ==  版本升级 appStore版本
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
    static func gotoAppstore() {
        if #available(iOS 10, *) {
            UIApplication.shared.open(URL(string: appStoreUrl)!, options: [UIApplicationOpenURLOptionUniversalLinksOnly:true], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(URL(string: appStoreUrl)!)
        }
        
    }
}
