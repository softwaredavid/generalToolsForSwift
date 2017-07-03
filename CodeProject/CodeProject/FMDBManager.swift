//
//  FMDBManager.swift
//  CodeProject
//
//  Created by Apple on 2017/7/3.
//  Copyright © 2017年 WangDaoLeTu. All rights reserved.
//
fileprivate let dbName = "app.sqlite"

import UIKit

class FMDBManager: NSObject {
    
    static let shareFMDBManager = FMDBManager()
    
    var dbQueue: FMDatabaseQueue?
    
    override init() {
        super.init()
        createDB(name: dbName)
    }
    
    func createDB(name: String) {
        if dbQueue != nil {
            close()
        }
        let path = AppManager.getSandboxPath(path: name)
        dbQueue = FMDatabaseQueue(url: path)
    }
    
    func createTable(name: String) {
        let sql = "CREATE TABLE IF NOT EXISTS '\(name)' ('id' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL , 'name' TEXT)"
        guard let _ = dbQueue else { print("表创建失败"); return }
        dbQueue!.inDatabase { (db) in
            do {
                try db.executeUpdate(sql, values: nil)
            } catch {
                print("数据库表创建失败")
            }
        }
    }
    
    func insertInTable(name: String,para:[String]) {
        
        let sql = "INSERT INTO '\(name)'('name') VALUES (?)"
        guard let _ = dbQueue else { print("插入失败"); return  }
        dbQueue!.inDatabase { (db) in
            do {
                try db.executeUpdate(sql, values: para)
            } catch {
                print("插入失败")
            }
        }
    }
    
    /*func updateTable(name: String, key: [String], value: [String]) {// 有问题
        
        let sql = "UPDATE '\(name)' SET 'name' = 'hhhh' WHERE 'id' = 5"
        guard let _ = dbQueue else { print("更新失败"); return  }
        dbQueue!.inDatabase { (db) in
            do {
                try db.executeUpdate(sql, values: nil)
            } catch {
                print("更新失败")
            }
        }
    }*/
    
    func dropTable(name: String) {
        
        let sql = "DROP TABLE '\(name)'"
        guard let _ = dbQueue else { print("删除失败"); return  }
        dbQueue!.inDatabase { (db) in
            do {
                try db.executeUpdate(sql, values: nil)
            } catch {
                print("删除失败")
            }
        }
    }
    
    // MARK: ----- 删除表
    func clearTable(name: String) {
        let sql = "DELETE from '\(name)'"
        guard let _ = dbQueue else { print("清除失败"); return  }
        dbQueue!.inDatabase { (db) in
            do {
                try db.executeUpdate(sql, values: nil)
            } catch {
                print("清除失败")
            }
        }
    }
    
    private func close() {
        dbQueue?.close()
        dbQueue = nil
    }

}
