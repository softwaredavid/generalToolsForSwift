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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addController()
    }
    
    private func addController() {
        
        addChildViewController(para: TabBarPara(title: "首页", image: "", selectImage: "", vcName: "HomeViewController"))
        addChildViewController(para: TabBarPara(title: "首页", image: "", selectImage: "", vcName: "ShopViewController"))
        addChildViewController(para: TabBarPara(title: "首页", image: "", selectImage: "", vcName: "MeViewController"))
        addChildViewController(para: TabBarPara(title: "首页", image: "", selectImage: "", vcName: "DiscouverViewController"))
    }
    
    private func addChildViewController(para: TabBarPara) {
        
        let vc = AppManager.getViewController(name: para.vcName)
        guard let v = vc else { return }
        v.tabBarItem.image = UIImage(named: "")
        v.tabBarItem.selectedImage = UIImage(named: "")
        v.title = para.title
        let nav = BaseNavigationViewController(rootViewController: v)
   
        addChildViewController(nav)
    }
    
}
