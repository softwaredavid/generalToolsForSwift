//
//  TransitionInteractive.swift
//  ModealAnimation
//
//  Created by Apple on 2017/4/10.
//  Copyright © 2017年 EdisonDu. All rights reserved.
//

import UIKit

class TransitionInteractive: UIPercentDrivenInteractiveTransition {
    
    var dismissController: UIViewController?
    var isGestureDis = false
    private var shouldCompolete: Bool = false
    
    func addGesturePresent(viewController: UIViewController) {
        dismissController = viewController
        viewController.view.addGestureRecognizer(createSwipGesture())
    }
    func createSwipGesture() -> UIPanGestureRecognizer {
        let panGesture = UIPanGestureRecognizer.init(target: self, action: #selector(handelSwipGesture(panGesture:)))
        return panGesture
    }
    override var completionSpeed: CGFloat {
        set {}
        get{
            return 1 - percentComplete
        }
    }
    @objc private func handelSwipGesture(panGesture: UIPanGestureRecognizer) {
        let point = panGesture.translation(in: panGesture.view?.superview)
        switch panGesture.state {
        case .began:
            isGestureDis = true
            self.dismissController?.dismiss(animated: true, completion: nil)
            break
        case .changed:
            let complete = point.y / (panGesture.view?.bounds.height)!
            let present = fminf(fmaxf(Float(-complete), 0.0), 1.0)
            if complete < 0 {
                shouldCompolete = (present < 0.5)
                update(-complete)
            } else {
                shouldCompolete = true
            }
            break
        case .ended:
            fallthrough
        case .cancelled:
            isGestureDis = false
            if !shouldCompolete || panGesture.state == .cancelled {
                finish()
            } else {
                cancel()
            }
            break
        default:
            break
            
        }
    }
}
