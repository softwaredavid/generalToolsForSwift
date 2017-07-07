//
//  AppDelegate.swift
//  CodeProject
//
//  Created by Apple on 2017/6/26.
//  Copyright © 2017年 WangDaoLeTu. All rights reserved.
//

import UIKit
import Alamofire

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        AppUtil.setRootViewController(window: window)
        window!.makeKeyAndVisible()
        configureAlamofireManager()//配置https无证书认证
        
        AppManager.configNavBar()
        
        return true
    }
    
    // ios 9.0
    @available(iOS 9.0, *)
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        if url.host == "safepay" {
            AlipaySDK.defaultService().processOrder(withPaymentResult: url, standbyCallback: { (dic) in
                if (PayManager.transformOrderParamterFormAlipay(dic) != nil) {}
            })
        } else {
            WXApi.handleOpen(url, delegate: PayManager.instance)
        }
        
        return true
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        if url.host == "safepay" {
            AlipaySDK.defaultService().processOrder(withPaymentResult: url, standbyCallback: { (dic) in
                if (PayManager.transformOrderParamterFormAlipay(dic) != nil) {}
            })
        } else {
            WXApi.handleOpen(url, delegate: PayManager.instance)
        }
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        
    }
    
    private func configureAlamofireManager() { //配置https证书验证
        //认证相关设置
        let manager = Alamofire.SessionManager.default
        manager.delegate.sessionDidReceiveChallenge = { session, challenge in
            //无证书 认证
            if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust {
                let credential = URLCredential(trust: challenge.protectionSpace.serverTrust!)
                return (.useCredential, credential)
            } else {
                return (.cancelAuthenticationChallenge, nil)
            }
        }
    }
    
    
}

