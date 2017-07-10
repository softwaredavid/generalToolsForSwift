//
//  PresentedViewController.swift
//  CodeProject
//
//  Created by Apple on 2017/7/7.
//  Copyright © 2017年 WangDaoLeTu. All rights reserved.
//

import UIKit

class PresentedViewController: BaseViewController {

    let edgePanGesture = UIScreenEdgePanGestureRecognizer()
    var navigationDelegate: TransitonAnimatonManager?
    let percentDrivenTransition = UIPercentDrivenInteractiveTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        edgePanGesture.edges = .right
        edgePanGesture.addTarget(self, action: #selector(handleEdgePanGesture(gesture:)))
        view.addGestureRecognizer(edgePanGesture)
        
        let btn = UIButton(type: .system)
        btn.frame = CGRect(x: 100, y: 100, width: 50, height: 50)
        btn.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        view.addSubview(btn)
        // Do any additional setup after loading the view.
    }
    func handleEdgePanGesture(gesture: UIScreenEdgePanGestureRecognizer){
        
        let translationX =  gesture.translation(in: view).x
        let translationBase: CGFloat = view.frame.width / 3
        let translationAbs = translationX > 0 ? translationX : -translationX
        let percent = translationAbs > translationBase ? 1.0 : translationAbs / translationBase
        switch gesture.state{
        case .began:
                dismiss(animated: true, completion: nil)
            
        case .changed:
           percentDrivenTransition.update(percent)
        case .cancelled, .ended:
            if percent > 0.5{
                percentDrivenTransition.finish()
            }else{
                percentDrivenTransition.cancel()
            }
            
            default: break
        }
    }

    func btnClick() {
        
        dismiss(animated: true, completion: nil)
    }
    
    deinit{
        edgePanGesture.removeTarget(self, action: #selector(handleEdgePanGesture(gesture:)))
    }
}
