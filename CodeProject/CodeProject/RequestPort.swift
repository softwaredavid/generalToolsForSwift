//
//  RequestPort.swift
//  XibProgect
//
//  Created by Apple on 2017/6/26.
//  Copyright © 2017年 WangDaoLeTu. All rights reserved.
//

import Foundation

let appStoreUrl = "https://itunes.apple.com/cn/app/%E4%B9%90%E9%81%93%E6%B8%B8/id1220810675?mt=8"

#if DEBUG
    
// MARK: -------------测试环境---------------------
    
fileprivate let baseDomain = "http://"

fileprivate let baseImageDomain = ""
    
#else

// MARK: -------------测试环境---------------------
    
fileprivate let baseDomain = "http://"
    
fileprivate let baseImageDomain = ""
    
#endif

// MARK: -------------模块一---------------------

let homeUrl = baseDomain + ""

// MARK: -------------模块二---------------------

// MARK: -------------模块三---------------------

// MARK: -------------模块四---------------------
