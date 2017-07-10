//
//  UITableView+Extension.swift
//  CodeProject
//
//  Created by Apple on 2017/7/5.
//  Copyright © 2017年 WangDaoLeTu. All rights reserved.
//

import Foundation

extension UITableView {

    func refresh(header: @escaping () -> Swift.Void, footer: @escaping () -> Swift.Void) {
        mj_header = MJRefreshNormalHeader(refreshingBlock: {
            
            header()
        })
        let footer = MJRefreshAutoNormalFooter {
            
            footer()
        }
        footer?.setTitle("", for: .idle)
        mj_footer = footer
    }
    
    func endResh() {
        if mj_header.isRefreshing() {
            mj_header.endRefreshing()
        }
        if mj_footer.isRefreshing() {
            mj_footer.endRefreshing()
        }
    }
}
