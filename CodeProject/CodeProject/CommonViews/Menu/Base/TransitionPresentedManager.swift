//
//  TransitionPresentedManager.swift
//  ModealAnimation
//
//  Created by Apple on 2017/4/10.
//  Copyright © 2017年 EdisonDu. All rights reserved.
//

import UIKit

class TransitionPresentedManager: UIPresentationController
{
    /*
     1.如果不自定义转场modal出来的控制器会移除原有的控制器
     2.如果自定义转场modal出来的控制器不会移除原有的控制器
     3.如果不自定义转场modal出来的控制器的尺寸和屏幕一样
     4.如果自定义转场modal出来的控制器的尺寸我们可以自己在containerViewWillLayoutSubviews方法中控制
     5.containerView 非常重要, 容器视图, 所有modal出来的视图都是添加到containerView上的
     6.presentedView() 非常重要, 通过该方法能够拿到弹出的视图
     */
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
    }
    //在此可以布局子视图
    override func containerViewWillLayoutSubviews() {
        presentedView?.frame = CGRect(x: 20, y: 20, width: 200, height: 400)
        containerView?.insertSubview(backView, at: 0)
        //containerView?.frame = (containerView?.frame.offsetBy(dx: 100, dy: 0))!
    }
    lazy var backView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        view.backgroundColor = UIColor.orange
        return view
        
    }()
    
    override func presentationTransitionWillBegin() {
    }
    
    override func presentationTransitionDidEnd(_ completed: Bool) {
    }
    
    override func dismissalTransitionWillBegin() {
    }
    
    override func dismissalTransitionDidEnd(_ completed: Bool) {
    }
    
}
