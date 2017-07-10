//
//  FMDBManager.swift
//  CodeProject
//
//  Created by Apple on 2017/7/3.
//  Copyright © 2017年 WangDaoLeTu. All rights reserved.
//
fileprivate let dbName = "app.sqlite"

fileprivate let createSql = "CREATE TABLE IF NOT EXISTS 'main' ('id' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL , 'name' TEXT)"

fileprivate let insertSql = "INSERT INTO 'main'('name') VALUES (?)"

fileprivate let removeTab = "DROP TABLE 'main'"

fileprivate let clearData = "DELETE FROM 'main' WHERE id = 12"

fileprivate let updateTab = "UPDATE 'main' SET 'name' = 'uuuuuuuuuu' WHERE id = 7"

fileprivate let selectSql = "SELECT * FROM 'main'"




import UIKit

class FMDBManager: NSObject {
    
    static let shareFMDBManager = FMDBManager()
    
    var dbQueue: FMDatabaseQueue?
    
    //创建数据库
    func createDB(name: String?) {
        if dbQueue != nil {
            close()
        }
        let path = AppUtil.getSandboxPath(path: name ?? dbName)
        dbQueue = FMDatabaseQueue(url: path)
    }
    
    func createTable(name: String) {
        let sql = createSql
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
        
        let sql = insertSql
        guard let _ = dbQueue else { print("插入失败"); return  }
        dbQueue!.inDatabase { (db) in
            do {
                try db.executeUpdate(sql, values: para)
            } catch {
                print("插入失败")
            }
        }
    }
    
    func updateTable(name: String, key: [String], value: [String]) {// 有问题
        
        let sql = updateTab
        guard let _ = dbQueue else { print("更新失败"); return  }
        dbQueue!.inDatabase { (db) in
            do {
                try db.executeUpdate(sql, values: nil)
            } catch {
                print("更新失败")
            }
        }
    }
    
    func dropTable(name: String) {
        
        let sql = removeTab
        guard let _ = dbQueue else { print("删除失败"); return  }
        dbQueue!.inDatabase { (db) in
            do {
                try db.executeUpdate(sql, values: nil)
            } catch {
                print("删除失败")
            }
        }
    }
    
    // MARK: ----- 删除表中的数据
    func clearTable(name: String) {
        let sql = clearData
        guard let _ = dbQueue else { print("清除失败"); return  }
        dbQueue!.inDatabase { (db) in
            do {
                try db.executeUpdate(sql, values: nil)
            } catch {
                print("清除失败")
            }
        }
    }
    func selectData() {
        let sql = selectSql
        guard let _ = dbQueue else { print("查询失败"); return  }
        dbQueue!.inDatabase { (db) in
            do {
               let res = try db.executeQuery(sql, values: nil)
                while res.next() {
                   // let naem = res.string(forColumn: "name")
                }
            } catch {
                print("查询失败")
            }
        }
    
    }
    
    private func close() {
        dbQueue?.close()
        dbQueue = nil
    }

}
