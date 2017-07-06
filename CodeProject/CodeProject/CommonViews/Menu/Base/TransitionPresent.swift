//
//  TransitionPresent.swift
//  ModealAnimation
//
//  Created by Apple on 2017/4/10.
//  Copyright © 2017年 EdisonDu. All rights reserved.
//

import UIKit

class TransitionPresent: NSObject,
UIViewControllerAnimatedTransitioning {
    
    var viewAppearAnimate: viewAppearAnimate = .viewAppdarFromTop
    
    //返回转场动画的时间
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    //执行转场动画
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        /*
         let toVC = transitionContext.viewController(forKey: .to)
         let fromVC = transitionContext.viewController(forKey: .from)
         let continerView = transitionContext.containerView
         let toView = transitionContext.view(forKey: .to)
         let fromView = transitionContext.view(forKey: .from)
         */
        let continerView = transitionContext.containerView
        let toView = transitionContext.view(forKey: .to)
        continerView.addSubview(toView!)
        //在此可以执行动画
        
        switch viewAppearAnimate {
        case .viewAppdarFromTop:
            toView?.layer.anchorPoint = CGPoint(x: 0.5, y: 0.0)
            toView?.transform = CGAffineTransform(scaleX: 1.0, y: 0.00001)
        case .viewAppearFromLeft:
            toView?.layer.anchorPoint = CGPoint(x: 0.0, y: 1)
            toView?.transform = CGAffineTransform(scaleX: 0.00001, y: 1.0)
        case .viewAppearFromRight:
            toView?.layer.anchorPoint = CGPoint(x: 1, y: 0.0)
            toView?.transform = CGAffineTransform(scaleX: 0.00001, y: 1.0)
        }
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            toView?.transform = CGAffineTransform.identity
        }) { (_) in
            transitionContext.completeTransition(true)
        }
    }
}
