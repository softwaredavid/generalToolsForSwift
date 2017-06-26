//
//  BaseNavigationViewController.swift
//  PartOfXib
//
//  Created by Apple on 2017/6/26.
//  Copyright © 2017年 WangDaoLeTu. All rights reserved.
//

import UIKit

class BaseNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.barTintColor = mainThemeColor
    }
}
