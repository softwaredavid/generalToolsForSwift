//
//  UIView+Exention.swift
//  CodeProject
//
//  Created by Apple on 2017/7/5.
//  Copyright © 2017年 WangDaoLeTu. All rights reserved.
//

import Foundation

extension UIView {
    var x: CGFloat {
        set {
            frame.origin.x = newValue
        }
        get {
            return frame.origin.x
        }
    }
    var y: CGFloat {
        set {
            frame.origin.y = newValue
        }
        get {
            return frame.origin.y
        }
    }
    var width: CGFloat {
        set {
            frame.size.width = newValue
        }
        get {
            return frame.size.width
        }
    }
    var height: CGFloat {
        set {
            frame.size.height = newValue
        }
        get {
            return frame.size.height
        }
    }
    
    func border(width: CGFloat, color: UIColor) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
    
//    func getViewController() -> UIViewController? {
//        let res = next
//        while res != nil {
//            if res is UIViewController {
//                return res as? UIViewController
//            }
//        }
//        return nil
//    }
}
