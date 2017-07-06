//
//  TransitionDismiss.swift
//  ModealAnimation
//
//  Created by Apple on 2017/4/10.
//  Copyright © 2017年 EdisonDu. All rights reserved.
//

import UIKit

class TransitionDismiss: NSObject,
UIViewControllerAnimatedTransitioning {
    
    var viewDispearAnimate: viewAppearAnimate = .viewAppdarFromTop
    
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
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            fromView?.transform = CGAffineTransform(scaleX: 1.0, y: 0.000000001)
            
            switch self.viewDispearAnimate {
            case .viewAppdarFromTop:
                fromView?.transform = CGAffineTransform(scaleX: 1.0, y: 0.000000001)
            case .viewAppearFromLeft:
                fromView?.transform = CGAffineTransform(scaleX: 0.00001, y: 1.0)
            case .viewAppearFromRight:
                fromView?.transform = CGAffineTransform(scaleX: 0.00001, y: 1.0)
            }
        }) { (_) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
    
}
