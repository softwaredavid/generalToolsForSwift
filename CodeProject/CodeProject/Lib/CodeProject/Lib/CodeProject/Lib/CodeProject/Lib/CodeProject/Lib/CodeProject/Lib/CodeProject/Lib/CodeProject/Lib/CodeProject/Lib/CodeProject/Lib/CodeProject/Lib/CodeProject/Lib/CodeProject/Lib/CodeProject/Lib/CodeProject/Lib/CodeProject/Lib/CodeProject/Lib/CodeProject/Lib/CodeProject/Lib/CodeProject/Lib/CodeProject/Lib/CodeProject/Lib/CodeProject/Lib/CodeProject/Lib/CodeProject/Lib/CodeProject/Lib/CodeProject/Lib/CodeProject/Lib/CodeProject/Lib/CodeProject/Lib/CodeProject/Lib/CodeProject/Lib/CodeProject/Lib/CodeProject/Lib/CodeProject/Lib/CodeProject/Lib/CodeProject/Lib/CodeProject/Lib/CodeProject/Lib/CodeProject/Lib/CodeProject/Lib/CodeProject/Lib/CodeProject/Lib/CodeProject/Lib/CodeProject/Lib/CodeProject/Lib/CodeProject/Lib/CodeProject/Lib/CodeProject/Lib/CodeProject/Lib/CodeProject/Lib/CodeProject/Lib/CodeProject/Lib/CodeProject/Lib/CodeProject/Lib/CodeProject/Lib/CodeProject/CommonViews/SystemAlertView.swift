//
//  SystemAlertView.swift
//  CodeProject
//
//  Created by Apple on 2017/7/5.
//  Copyright © 2017年 WangDaoLeTu. All rights reserved.
//

import UIKit

class SystemAlertView: UIView {
    
    // MARK: --显示一个系统的提示框
    static func showAlertView(controller: UIViewController,message: String,handler: ((String) -> ())?) {
        let alet = UIAlertController(title: "温馨提示", message: message, preferredStyle: .alert)
        let btn1 = UIAlertAction(title: "确定", style: .default) { (title) in
            handler?("确定")
        }
        let btn2 = UIAlertAction(title: "取消", style: .default) { (title) in
            handler?("取消")
        }
        alet.addAction(btn1)
        alet.addAction(btn2)
        controller.present(alet, animated: true, completion: nil)
    }
    // MARK: --显示一个系统的ActionSheet
    static func showActionSheet(controller: UIViewController,btns: [String],handler: ((String) -> ())?) {
        
        let action = UIAlertController(title: "请选择", message: "", preferredStyle: .actionSheet)
        for item in btns {
            let btn = UIAlertAction(title: item, style: .default) { (title) in
                handler?(item)
            }
            action.addAction(btn)
        }
        let btn = UIAlertAction(title: "取消", style: .destructive) { (title) in
        }
        action.addAction(btn)
        controller.present(action, animated: true, completion: nil)
        
    }

}
