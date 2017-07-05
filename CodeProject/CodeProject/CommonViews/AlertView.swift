//
//  AlertView.swift
//  CodeProject
//
//  Created by Apple on 2017/6/26.
//  Copyright © 2017年 WangDaoLeTu. All rights reserved.
//

import UIKit
struct AlertConfig {
    var offsetY: CGFloat = 0
    var offetX: CGFloat = 0
    var margin: CGFloat = 20
    var fontSize: CGFloat = 13
}

class AlertView: NSObject {
    
    // MARK ---- 显示一个toast 1.5后自动消失
    static func show(text: String) {
        guard let hud = AlertView.getMB(text: text) else { return }
        hud.hide(animated: true, afterDelay: 1.5)
    }
    
    // MARK ---- 显示一个toast 1.5后自动消失 加上配置
    static func show(text: String, config: AlertConfig) {
        guard let hud = AlertView.getMB(text: text) else { return }
        hud.offset.y = config.offsetY
        hud.offset.x = config.offetX
        hud.label.font = UIFont.systemFont(ofSize: config.fontSize)
        hud.margin = config.margin
        hud.hide(animated: true, afterDelay: 1.5)
        
    }
    
    // MARK ---- 显示网络请求菊花
    @discardableResult
    static func showProgressView(text: String) -> MBProgressHUD? {
        guard let window = AppManager.getKeyWindow() else { return nil }
        let hud = MBProgressHUD.showAdded(to: window, animated: true)
        hud.backgroundView.style = .solidColor;
        hud.backgroundView.color = UIColor.lightGray;
        hud.label.text = text
        hud.minSize = CGSize(width: 100, height: 50)
        return hud
    }
    
    private static func getMB(text: String) -> MBProgressHUD? {
        guard let window = AppManager.getKeyWindow() else { return nil }
        let hud = MBProgressHUD.showAdded(to: window, animated: true)
        hud.mode = .text
        hud.label.text = text
        hud.label.font = UIFont.systemFont(ofSize: 13)
        hud.bezelView.color = UIColor.black.withAlphaComponent(0.8)
        hud.label.textColor = UIColor.white
        return hud
    }
    
}
