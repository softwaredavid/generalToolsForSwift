//
//  TransitionPresentedManager.swift
//  ModealAnimation
//
//  Created by Apple on 2017/4/10.
//  Copyright © 2017年 EdisonDu. All rights reserved.
//

import UIKit

enum viewAppearAnimate {
    case viewAppearFromLeft
    case viewAppearFromRight
    case viewAppdarFromTop
}

class TransitionPresentedManager: UIPresentationController {
    var presentViewFrame: CGRect!
    var containerViewFrame: CGRect!
    /*
     1.如果不自定义转场modal出来的控制器会移除原有的控制器
     2.如果自定义转场modal出来的控制器不会移除原有的控制器
     3.如果不自定义转场modal出来的控制器的尺寸和屏幕一样
     4.如果自定义转场modal出来的控制器的尺寸我们可以自己在containerViewWillLayoutSubviews方法中控制
     5.containerView 所有modal出来的视图都是添加到containerView上的
     6.presentedView()  通过该方法能够拿到弹出的视图
     */
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
    }
    
    //containerView?.frame.offsetBy(dx: 100, dy: 0)
    override func containerViewWillLayoutSubviews() {
        presentedView?.frame = presentViewFrame
        containerView?.frame = containerViewFrame
    }
    
    override func presentationTransitionWillBegin() {
        
    }
    
    override func presentationTransitionDidEnd(_ completed: Bool) {
        
    }
    
    override func dismissalTransitionWillBegin() {
        
    }
    
    override func dismissalTransitionDidEnd(_ completed: Bool) {
        
    }
    
}
