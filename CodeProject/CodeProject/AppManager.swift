//
//  AppManager.swift
//  PartOfXib
//
//  Created by Apple on 2017/6/26.
//  Copyright © 2017年 WangDaoLeTu. All rights reserved.
//

import UIKit

class AppManager: NSObject {
    
    // MARK: ==  设置window的根视图
    static func setRootViewController(window: UIWindow? = nil) {
        guard let _ = window else { return }
        window?.rootViewController = BaseTabBarViewController()
    }
    
    // MARK: == 得到key Window
    static func getKeyWindow() -> UIWindow? {
        return UIApplication.shared.keyWindow
    }
    
    // MARK: == 从storyBoard得到ViewCntroller
    static func getViewController<T: UIViewController>(storyBoard: String, identify: String) -> T {
        let sb = UIStoryboard(name: storyBoard, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: identify) as! T
        return vc
    }
    
    // MARK: == 用一个字符串创建一个类
    static func getViewController<T: UIViewController>(name: String!) -> T? {
        
        guard let projectName =  Bundle.main.infoDictionary!["CFBundleExecutable"] as? String else { return nil }
        let cls: AnyClass? = NSClassFromString(projectName + "." + name)
        guard let typeCls = cls as? UIViewController.Type else { return nil }
        let vc = typeCls.init()
        
        return vc as? T ?? nil
    }
    
    // MARK: == 得到沙盒路径
    static func getSandboxPath(path: String) -> URL? {
        
        let p = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last
        guard let _ = p else { return nil }
        let pUrl = URL(string: p!)
        return pUrl?.appendingPathComponent(path)
    }
    
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


