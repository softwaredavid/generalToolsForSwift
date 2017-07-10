//
//  TabViewDelegate.swift
//  CodeProject
//
//  Created by Apple on 2017/7/4.
//  Copyright © 2017年 WangDaoLeTu. All rights reserved.
//

import UIKit

class TabViewDelegate: NSObject,UITableViewDelegate {
    
    var delegate: TabDelegate?
    var heightArray: [CGFloat]!
    var heightHeaderArray: [CGFloat]?
    var heightFooterArray: [CGFloat]?
    var sourceArray: [Any]?
    var hasHeader = false
    var hasFooter = false
    override init() {
        super.init()
    }
    convenience init(heightArray: [CGFloat]) {
        self.init()
        self.heightArray = heightArray
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { //如果需要动态改变cell的高度 需要再加一个数组
        
        return heightArray[indexPath.section]
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard let _ = heightHeaderArray else { return 0 }
        if heightHeaderArray?.count == 1 {
            return heightHeaderArray!.first!
        }
        return heightHeaderArray![section]
    }
    
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        guard let _ = heightFooterArray else { return 0 }
        if heightFooterArray?.count == 1 {
            return heightFooterArray!.first!
        }
        return heightFooterArray![section]
    }
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if !hasHeader { return nil }
        let viewR = tableView.dequeueReusableHeaderFooterView(withIdentifier: "") as! TabbReuseHeaderView
        return viewR
    }
    
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if !hasFooter { return nil }
        let viewR = tableView.dequeueReusableHeaderFooterView(withIdentifier: "") as! TabbReuseHeaderView
//        viewR.tapC = { [weak self] in
//            self?.view.endEditing(true)
//        }
        viewR.configData(data: sourceArray?[section] ?? "")
        return viewR
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.table(tableView, didSelectRowAt: indexPath)
    }
}

protocol TabDelegate {
    
    func table(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    
}
