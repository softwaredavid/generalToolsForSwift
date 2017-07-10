//
//  PresentingViewController.swift
//  CodeProject
//
//  Created by Apple on 2017/7/7.
//  Copyright © 2017年 WangDaoLeTu. All rights reserved.
//

import UIKit

class PresentingViewController: BaseViewController {

    let edgePanGesture = UIScreenEdgePanGestureRecognizer()
    var navigationDelegate: ModalTransitionDelegate?
    let percentDrivenTransition = ModalTransitionDelegate()
    let pre = PresentedViewController()
    
    let presentTransitionDelegate = ModalTransitionDelegate()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        edgePanGesture.edges = .left
        edgePanGesture.addTarget(self, action: #selector(handleEdgePanGesture(gesture:)))
        view.addGestureRecognizer(edgePanGesture)
        
        pre.transitioningDelegate = presentTransitionDelegate
        pre.modalPresentationStyle = .custom
        
        let btn = UIButton(type: .system)
        btn.frame = CGRect(x: 100, y: 100, width: 50, height: 50)
        btn.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        view.addSubview(btn)
        
    }
    
    func btnClick() {
        present(pre, animated: true, completion: nil)
    }
    
    func handleEdgePanGesture(gesture: UIScreenEdgePanGestureRecognizer){
        if gesture.state == .cancelled || gesture.state == .ended {
            navigationDelegate = transitioningDelegate as? ModalTransitionDelegate
            navigationDelegate?.interactive = true
            present(pre, animated: true, completion: nil)
            
       }
    }
    deinit{
        edgePanGesture.removeTarget(self, action: #selector(handleEdgePanGesture(gesture:)))
    }
    
}
