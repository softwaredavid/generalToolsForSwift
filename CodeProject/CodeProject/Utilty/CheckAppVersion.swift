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
    
   // MARK: == 本地版本 处理引导图用
    static func isNewVersion() -> Bool {
        let currentVersion = getCurentAppVersion()
        let sanboxVersion = userDefault.string(forKey: versionApp) ?? "0.0"
        if currentVersion > sanboxVersion {
            userDefault.set(currentVersion, forKey: versionApp)
            return true
        }
        return false
    }
    
    // MARk: ==  版本升级 appStore版本
    static func upgradeApp(complete: @escaping ((String?, Bool)->Void)) {
        AppNet.post(url: appStoreUrl,header: ["Content-Type":"application/json"]) { (dic) in
            guard let results = (dic as! [String:Any])["results"] as? [[String:Any]] else { return }
            if results.count > 0 {
                var releaseNotes = ""
                if let str = results[0]["releaseNotes"] as? String {
                    releaseNotes = str
                }
                let v = "\(Bundle.main.infoDictionary!["CFBundleShortVersionString"]!)"
                let appStor = "\(String(describing: results[0]["version"]!))"
                if v < appStor {
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
