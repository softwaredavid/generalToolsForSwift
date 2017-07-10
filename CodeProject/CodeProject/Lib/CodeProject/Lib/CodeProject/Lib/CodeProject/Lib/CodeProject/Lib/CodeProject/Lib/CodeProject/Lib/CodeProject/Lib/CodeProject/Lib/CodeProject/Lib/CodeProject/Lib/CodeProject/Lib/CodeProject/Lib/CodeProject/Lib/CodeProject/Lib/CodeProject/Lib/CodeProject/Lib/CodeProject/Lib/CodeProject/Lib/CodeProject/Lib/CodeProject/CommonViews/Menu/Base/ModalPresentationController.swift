//
//  ModalPresentationController.swift
//  CodeProject
//
//  Created by Apple on 2017/7/7.
//  Copyright © 2017年 WangDaoLeTu. All rights reserved.
//

import UIKit

class ModalPresentationController: UIPresentationController {
    
    let dimmingView = UIView()
    let edgePanGesture = UIScreenEdgePanGestureRecognizer()
    var navigationDelegate: TransitonAnimatonManager?
    let percentDrivenTransition = UIPercentDrivenInteractiveTransition()
    
    override func presentationTransitionWillBegin() {
        containerView?.addSubview(dimmingView)
        
        let dimmingViewInitailWidth = containerView!.frame.width , dimmingViewInitailHeight = containerView!.frame.height
        dimmingView.backgroundColor = UIColor(white: 0.0, alpha: 0.5)
        dimmingView.center = containerView!.center
        dimmingView.bounds = CGRect(x: 0, y: 0, width: dimmingViewInitailWidth , height: dimmingViewInitailHeight)
        
//        edgePanGesture.edges = .right
//        edgePanGesture.addTarget(self, action: #selector(handleEdgePanGesture(gesture:)))
//        dimmingView.addGestureRecognizer(edgePanGesture)
        
        _ = presentedViewController.transitionCoordinator?.animate(alongsideTransition: {
            _ in
            self.dimmingView.bounds = self.containerView!.bounds
        }, completion: nil)
    }
    
//    func handleEdgePanGesture(gesture: UIScreenEdgePanGestureRecognizer){
//        
//        let translationX =  gesture.translation(in: presentedViewController.view).x
//        let translationBase: CGFloat = presentedViewController.view.frame.width / 3
//        let translationAbs = translationX > 0 ? translationX : -translationX
//        let percent = translationAbs > translationBase ? 1.0 : translationAbs / translationBase
//        
//        switch gesture.state{
//        case .began:
//            presentedViewController.dismiss(animated: true, completion: nil)
//        case .changed:
//            percentDrivenTransition.update(percent)
//        case .cancelled, .ended:
//            if percent > 0.5{
//                percentDrivenTransition.finish()
//            }else{
//                percentDrivenTransition.cancel()
//            }
//            
//        default: break
//        }
//    }
    
    override func dismissalTransitionWillBegin() {
        _ = presentedViewController.transitionCoordinator?.animate(alongsideTransition: { _ in
            self.dimmingView.alpha = 0.0
        }, completion: nil)
    }
    
    override func containerViewWillLayoutSubviews(){
        dimmingView.center = containerView!.center
        dimmingView.bounds = containerView!.bounds
        presentedView?.frame = CGRect(x: 0, y: 0, width: 300, height: screen_heigh)
    }
    
    deinit{
       // edgePanGesture.removeTarget(self, action: #selector(handleEdgePanGesture(gesture:)))
    }
}
