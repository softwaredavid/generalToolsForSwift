//
//  BaseTabBarViewController.swift
//  PartOfXib
//
//  Created by Apple on 2017/6/26.
//  Copyright © 2017年 WangDaoLeTu. All rights reserved.
//

import UIKit

struct TabBarPara {
    var title: String!
    var image: String!
    var selectImage: String!
    var vcName: String!
}
class BaseTabBarViewController: UITabBarController {
    
    private var panGesture: UIPanGestureRecognizer = UIPanGestureRecognizer()
    private let tabBarVCDelegate = TabBarControllerDelegate()
    private var subViewControllerCount: Int {
        let count = viewControllers != nil ? viewControllers!.count : 0
        return count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addController()
        
        delegate = tabBarVCDelegate
        panGesture.addTarget(self, action: #selector(handlePan(panGesture:)))
        view.addGestureRecognizer(panGesture)
    }
    
    private func addController() {
        
        addChildViewController(para: TabBarPara(title: "首页", image: "", selectImage: "", vcName: "HomeViewController"))
        addChildViewController(para: TabBarPara(title: "首页", image: "", selectImage: "", vcName: "ShopViewController"))
        addChildViewController(para: TabBarPara(title: "首页", image: "", selectImage: "", vcName: "MeViewController"))
        addChildViewController(para: TabBarPara(title: "首页", image: "", selectImage: "", vcName: "DiscouverViewController"))
    }
    
    private func addChildViewController(para: TabBarPara) {
        
        let vc = AppUtil.getViewController(name: para.vcName)
        guard let v = vc else { return }
        v.tabBarItem.image = UIImage(named: "")
        v.tabBarItem.selectedImage = UIImage(named: "")
        v.title = para.title
        let nav = BaseNavigationViewController(rootViewController: v)
   
        addChildViewController(nav)
    }
    
    func handlePan(panGesture: UIPanGestureRecognizer) {
        
        let translationX =  panGesture.translation(in: view).x
        let translationAbs = translationX > 0 ? translationX : -translationX
        let progress = translationAbs / view.frame.width
        switch panGesture.state {
        case .began:
            tabBarVCDelegate.interactive = true
            let velocityX = panGesture.velocity(in: view).x
            if velocityX < 0 {
                if selectedIndex < subViewControllerCount - 1 {
                    selectedIndex += 1
                }
            }else {
                if selectedIndex > 0 {
                    selectedIndex -= 1
                }
            }
        case .changed:
            tabBarVCDelegate.interactionController.update(progress)
        case .cancelled, .ended:
            /*这里有个小问题，转场结束或是取消时有很大几率出现动画不正常的问题。在8.1以上版本的模拟器中都有发现
             但在我的 iOS 9.2 的真机设备上没有发现，而且似乎只在 UITabBarController 的交互转场中发现了这个问题。在 NavigationController 暂且没发现这个问题，
             解决手段是修改交互控制器的 completionSpeed 为1以下的数值，这个属性用来控制动画速度
             这里其修改为0.99，既解决了 Bug 同时尽可能贴近原来的动画设定。
             */
            if progress > 0.3 {
                tabBarVCDelegate.interactionController.completionSpeed = 0.99
                tabBarVCDelegate.interactionController.finish()
            }else{
                //转场取消后，UITabBarController 自动恢复了 selectedIndex 的值，不需要我们手动恢复。
                tabBarVCDelegate.interactionController.completionSpeed = 0.99
                tabBarVCDelegate.interactionController.cancel()
            }
            tabBarVCDelegate.interactive = false
        default: break
        }
    }
}
