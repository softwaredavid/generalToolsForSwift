//
//  BaseViewController.swift
//  PartOfXib
//
//  Created by Apple on 2017/6/26.
//  Copyright © 2017年 WangDaoLeTu. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    private var noDataView: UIImageView!
    private var progressView: MBProgressHUD!
    var isHowLeftBack = true {
        didSet {
            hidenBackBtn()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        showLeftBackBtn()
    }
    
    func goToLogin() {
    
    
    }
    
    func showNoDataView() {
        noDataView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        noDataView.image = UIImage(named: "img_kong_zuchedd@3x")
        view.subviews.forEach { (view) in
            view.isHidden = true
        }
        noDataView.isHidden = false
        noDataView.center = view.center
        view.addSubview(noDataView)
    }
    
    func hiddenNoDataView() {
        
        view.subviews.forEach { (view) in
            view.isHidden = false
        }
        noDataView.removeFromSuperview()
    
    }
    
    func showLeftBackBtn() {
        let btn = UIButton(frame: CGRect.init(x: 0, y: 0, width: 44, height: 44))
        btn.setImage(UIImage(named: ""), for: .normal)
        btn.addTarget(self, action: #selector(back), for: .touchUpInside)
        let bar = UIBarButtonItem(customView: btn)
        navigationItem.leftBarButtonItem = bar
        hidenBackBtn()
    }
    
    func hidenBackBtn() {
        let hasSubviews = navigationController?.viewControllers.count != 0
        if !isHowLeftBack || !hasSubviews {
            navigationItem.leftBarButtonItem = nil
            navigationItem.hidesBackButton = true
        }
    }
    
    func back() {
        navigationController?.popViewController(animated: true)
    }
    
    func hiddenNavBar() {
        
        navigationController?.navigationBar.isHidden = true
        
    }
    
    func showLoadingView() {
       progressView = AlertView.showProgressView(text: "加载中")
    }
    
    func hiddenLoadingView() {
        progressView.hide(animated: true)
    }
    
    // MARK: ---子类重写
    func getNetData() {
    
    }
    
}
