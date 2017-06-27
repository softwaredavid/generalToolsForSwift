//
//  CheckAppVersion.swift
//  CodeProject
//
//  Created by Apple on 2017/6/26.
//  Copyright © 2017年 WangDaoLeTu. All rights reserved.
//

import UIKit

class CheckAppVersion: NSObject {
    
    static func checkAppVersion(handler: @escaping ((_ data: String?) -> Void)) {
        
       /* RequestForSwift.shared.post(url: appStoreUrl, success: { response in
            print(response)
            guard let results = (response as! [String:Any])["results"] as? [[String:Any]]else {
                return
            }
            if results.count > 0 {
                var releaseNotes = ""
                if let str = results[0]["releaseNotes"] as? String {
                    releaseNotes = str
                }
                let v = "\(Bundle.main.infoDictionary!["CFBundleShortVersionString"]!)"
                let appStor = "\(String(describing: results[0]["version"]!))"
                
                if Int(v.replacingOccurrences(of: ".", with: ""))! < Int(appStor.replacingOccurrences(of: ".", with: ""))! {
                    handler(releaseNotes)
                } else {
                    handler(nil)
                }
            }
        }) { error in
         UIApplication.shared.openURL(URL(string: "https://itunes.apple.com/cn/app/%E4%B9%90%E9%81%93%E6%B8%B8/id1220810675?mt=8")!)
            
        }*/
    }
}
