//
//  TransitionViewDelegate.swift
//  CodeProject
//
//  Created by Apple on 2017/7/6.
//  Copyright © 2017年 WangDaoLeTu. All rights reserved.
//

import UIKit

class TransitionViewDelegate: NSObject,UIViewControllerTransitioningDelegate {
    
    var transitionView = TransitionInteractive()
    
    func addGesture(viewController: UIViewController) {
        transitionView.addGesturePresent(viewController: viewController)
    }
    // 此方法返回一个UIPresentationController 对象 当设置modalPresentationStyle为custom时系统会用返回的对象来管理弹出的动画
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return TransitionPresentedManager.init(presentedViewController: presented, presenting: presenting)
    }
    //返回视图如何出现 需要实现UIViewControllerAnimatedTransitioning协议
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return TransitionPresent()
        
    }
    //返回视图如何消失 需要实现UIViewControllerAnimatedTransitioning协议
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return TransitionDismiss()
    }
    //手势消失 需要实现UIViewControllerInteractiveTransitioning协议
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return transitionView.isGestureDis ? transitionView : nil
    }
    
    
}
