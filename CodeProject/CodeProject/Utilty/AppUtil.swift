//
//  AppUtil.swift
//  CodeProject
//
//  Created by Apple on 2017/7/3.
//  Copyright © 2017年 WangDaoLeTu. All rights reserved.
//

import UIKit

class AppUtil: NSObject {
    
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
    static func getAttributeText(text: String?) -> NSAttributedString? {
        guard let text = text else { return nil }
        if text.isEmpty { return nil }
        let paraS = NSMutableParagraphStyle()
        paraS.lineSpacing = 10
        let dic = [NSFontAttributeName: UIFont.systemFont(ofSize: 13),NSParagraphStyleAttributeName: paraS,NSKernAttributeName: 0.3,NSForegroundColorAttributeName: UIColor.lightGray] as [String : Any]
        let str = NSMutableAttributedString.init(string: text, attributes: dic)
        return str
    }
}
