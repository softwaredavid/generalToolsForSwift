//
//  OverlayAnimationController.swift
//  CustomPresentationTransition
//
//  Created by seedante on 15/12/20.
//  Copyright © 2015年 seedante. All rights reserved.
//

import UIKit

class ModalAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        guard let fromVC = transitionContext.viewController(forKey: .from), let toVC = transitionContext.viewController(forKey: .to) else{
            return
        }
                
        let fromView = fromVC.view
        let toView = toVC.view
        let duration = self.transitionDuration(using: transitionContext)
        
        if toVC.isBeingPresented{
            containerView.addSubview(toView!)
            toView?.layer.anchorPoint = CGPoint(x: 0.0, y: 0.5)
            toView?.transform = CGAffineTransform(scaleX: 0.00001, y: 1)
            if #available(iOS 8, *){
                UIView.animate(withDuration: duration, delay: 0, options: .curveEaseInOut, animations: {
                    toView?.transform = CGAffineTransform.identity
                    }, completion: {_ in
                        transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
                })
            }
        }
        //Dismissal 转场中不要将 toView 添加到 containerView
        if fromVC.isBeingDismissed{
            let fromViewHeight = fromView?.frame.height
            UIView.animate(withDuration: duration, animations: {
                fromView?.bounds = CGRect(x: 0, y: 0, width: 1, height: fromViewHeight!)
                }, completion: { _ in
                    transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            })
        }
    }
}
