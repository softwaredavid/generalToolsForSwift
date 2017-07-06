//
//  TransitionDismiss.swift
//  ModealAnimation
//
//  Created by Apple on 2017/4/10.
//  Copyright © 2017年 EdisonDu. All rights reserved.
//

import UIKit

class TransitionDismiss: NSObject,
UIViewControllerAnimatedTransitioning
    
{   //返回转场动画的时间
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
        let fromView = transitionContext.view(forKey: .from)
        //在此可以执行动画
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            fromView?.transform = CGAffineTransform(scaleX: 1.0, y: 0.000000001)
        }) { (_) in
           transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
   
}
