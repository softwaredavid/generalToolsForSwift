//
//  GuideViewController.swift
//  CodeProject
//
//  Created by Apple on 2017/6/26.
//  Copyright © 2017年 WangDaoLeTu. All rights reserved.
//

import UIKit

class GuideViewController: UIViewController,SDCycleScrollViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        let cycleScrollView = SDCycleScrollView(frame: view.frame, delegate: self, placeholderImage: nil)
        cycleScrollView!.infiniteLoop = false
        cycleScrollView?.localizationImageNamesGroup = [""];
        cycleScrollView?.pageDotColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        cycleScrollView?.pageControlRightOffset = 0
        cycleScrollView?.pageControlBottomOffset = 0
        cycleScrollView?.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter
        view.addSubview(cycleScrollView!)
    }
    func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didScrollTo index: Int) {
        
    }
    func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didSelectItemAt index: Int) {
        
    }

}
