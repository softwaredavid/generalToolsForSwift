//
//  ModalTransitionDelegate.swift
//  CodeProject
//
//  Created by Apple on 2017/7/7.
//  Copyright © 2017年 WangDaoLeTu. All rights reserved.
//

import UIKit

class ModalTransitionDelegate: NSObject, UIViewControllerTransitioningDelegate  {
    
    var interactive = false
    let percentDrivenTransition = UIPercentDrivenInteractiveTransition()
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let m = ModalAnimationController()
       // m.toViewFrame = CGRect(x: 0, y: 0, width: 100, height: 100)
        return m
        //Or
        //        let transitionType = SDETransitionType.modalTransition(.presentation)
        //        return SlideAnimationController(type: transitionType)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ModalAnimationController()
        //Or
        //        let transitionType = SDETransitionType.modalTransition(.dismissal)
        //        return SlideAnimationController(type: transitionType)
    }
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        
        return ModalPresentationController(presentedViewController: presented, presenting: presenting)
    }
    
    public func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        
        return interactive ? percentDrivenTransition : nil
    }
    
    
    public func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
    
        return interactive ? percentDrivenTransition : nil
    }
}
