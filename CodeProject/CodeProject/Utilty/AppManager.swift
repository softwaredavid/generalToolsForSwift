//
//  AppManager.swift
//  PartOfXib
//
//  Created by Apple on 2017/6/26.
//  Copyright © 2017年 WangDaoLeTu. All rights reserved.
//
/**
 各种第三方
 */
import UIKit

extension Notification.Name {

}

class AppManager: NSObject {
    
    static func configNavBar() {
        let bar = UINavigationBar.appearance()
        bar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        bar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        bar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.red]
    }
       
}


