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
}
class BaseTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addController()
    }
    
    private func addController() {
        
        let home = getNav(storyBoard: "Home")
        addChildViewController(nav: home, para: TabBarPara(title: "首页", image: "", selectImage: ""))
        
        let shop = getNav(storyBoard: "Shop")
        addChildViewController(nav: shop, para: TabBarPara(title: "购物", image: "", selectImage: ""))
        
        let discover = getNav(storyBoard: "Discover")
        addChildViewController(nav: discover, para: TabBarPara(title: "发现", image: "", selectImage: ""))
        
        let me = getNav(storyBoard: "Me")
        addChildViewController(nav: me, para: TabBarPara(title: "我的", image: "", selectImage: ""))
        
    }
    
    private func addChildViewController(nav: BaseNavigationViewController, para: TabBarPara) {
        
        guard let vc = nav.viewControllers.first else { return  }
        vc.title = para.title
        vc.tabBarItem.image = UIImage(named: para.image)
        vc.tabBarItem.selectedImage = UIImage(named: para.selectImage)
   
        addChildViewController(nav)
    }
    
    private func getNav(storyBoard: String) -> BaseNavigationViewController {
        
        let nav = UIStoryboard(name: storyBoard, bundle: nil)
        
        return nav.instantiateInitialViewController() as! BaseNavigationViewController
    }
}
