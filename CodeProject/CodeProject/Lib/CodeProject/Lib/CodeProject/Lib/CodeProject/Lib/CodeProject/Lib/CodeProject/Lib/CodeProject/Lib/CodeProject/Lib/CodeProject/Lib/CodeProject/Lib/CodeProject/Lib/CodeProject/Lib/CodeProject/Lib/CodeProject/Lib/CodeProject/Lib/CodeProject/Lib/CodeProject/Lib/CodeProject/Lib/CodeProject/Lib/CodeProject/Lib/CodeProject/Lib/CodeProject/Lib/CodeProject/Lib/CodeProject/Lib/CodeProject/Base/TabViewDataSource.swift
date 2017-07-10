
//
//  TabeViewDataSource.swift
//  CodeProject
//
//  Created by Apple on 2017/7/4.
//  Copyright © 2017年 WangDaoLeTu. All rights reserved.
//

import UIKit

class TabViewDataSource: NSObject,UITableViewDataSource {
    var cellArray: [String]!
    var sourceArray: [[Any]]!
    var sessionTitle: [String]?
    
    override init() {
        super.init()
    }
    
    convenience init(cellArray: [String], sourceArray: [[Any]]) {
        self.init()
        self.cellArray = cellArray
        self.sourceArray = sourceArray
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return cellArray.count
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return sourceArray[section].count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellArray[indexPath.section], for: indexPath) as! BaseTableViewCell
        cell.configData(model: sourceArray[indexPath.section][indexPath.row])
        
        return cell
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        guard let _ = sessionTitle else { return nil }
        return sessionTitle
    }

}
