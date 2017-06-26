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
        guard let _ = window else {
            return
        }
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
    
}
