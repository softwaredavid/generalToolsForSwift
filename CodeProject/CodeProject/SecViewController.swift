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
        view.backgroundColor = UIColor.gray
//        showLoadingView()
//        
//        //sleep(5)
//        
//        hiddenLoadingView()
//        showNoDataView()
       /* s = TabViewDataSource(cellArray: ["one","two"], sourceArray: [["hello"],["hello",""]])
        tabView.dataSource = s
        
        d = TabViewDelegate(heightArray: [50,300])
        d.delegate = self
        tabView.delegate = d
        tabView.refresh(header: { [weak self] in

        }) {
            
        }
        
        tabView.reloadData()*/
       
        // Do any additional setup after loading the view.
        let btn = UIButton(frame: CGRect.init(x: 0, y: 0, width: 40, height: 40))
        btn.backgroundColor = UIColor.red
        btn.addTarget(self, action: #selector(c), for: .touchUpInside)
        view.addSubview(btn)
    }
    func c() {
        dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func table(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    
    }

}
