//
//  SecViewController.swift
//  CodeProject
//
//  Created by Apple on 2017/7/4.
//  Copyright © 2017年 WangDaoLeTu. All rights reserved.
//

import UIKit

class SecViewController: BaseViewController,TabDelegate {

    @IBOutlet weak var tabView: UITableView!
    var s: TabViewDataSource!
    var d: TabViewDelegate!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        s = TabViewDataSource(cellArray: ["one","two"], sourceArray: [["hello"],["hello",""]])
        tabView.dataSource = s
        
        d = TabViewDelegate(heightArray: [50,300])
        d.delegate = self
        tabView.delegate = d
        
        tabView.reloadData()
       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func table(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    
    }

}
