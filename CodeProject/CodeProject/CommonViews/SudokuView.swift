//
//  SudokuView.swift
//  CodeProject
//
//  Created by Apple on 2017/7/3.
//  Copyright © 2017年 WangDaoLeTu. All rights reserved.
//

import UIKit
struct ConfigItem {
    var height: CGFloat = 40
    var itemsInHer: CGFloat = 3
    var merginLeft: CGFloat = 10
    var merginTop: CGFloat = 10
}

class SudokuView: UIView {
    
    var clickItem: ((Int, String) -> ())?
    
    private var content: [String]!
    private var config: ConfigItem!
    
    convenience init(config: ConfigItem, frame: CGRect,content: [String]) {
        self.init(frame: frame)
        self.config = config
        self.frame = frame
        self.content = content
        configView()
    }
    private func configView() {
        
        var btnX: CGFloat = config.merginLeft
        var btnY: CGFloat = config.merginTop
        let btnW: CGFloat = (frame.size.width - config.merginLeft * (config.itemsInHer + 1)) / config.itemsInHer
        let btnH: CGFloat = config.height
        for (i,item) in content.enumerated() {
            let btn = UIButton(type: .system)
            btn .setTitle(item, for: .normal)
            btn.setTitleColor(UIColor.red, for: .normal)
            btn.layer.masksToBounds = true
            btn.layer.cornerRadius = 5
            btn.tag = 10 + i
            btn.layer.borderWidth = 1
            btn.layer.borderColor = UIColor.red.cgColor
            btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
            btnX = CGFloat(i % Int(config.itemsInHer)) * CGFloat((btnW + config.merginLeft)) + config.merginTop
            btnY = CGFloat(i / Int(config.itemsInHer)) * CGFloat((btnH + config.merginTop)) + config.merginTop
            btn.frame = CGRect(x: btnX, y: btnY, width: btnW, height: btnH)
            addSubview(btn)
        }
    }
    
    @objc private func btnClick(sender: UIButton) {
        clickItem?(sender.tag - 10, sender.currentTitle!)
    }
    
    func addSubview(config: ConfigItem, frame: CGRect,content: [String]) {
         configView()
    }
}
