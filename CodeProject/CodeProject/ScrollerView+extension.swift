//
//  ScrollerView+extension.swift
//  CodeProject
//
//  Created by Apple on 2017/7/5.
//  Copyright © 2017年 WangDaoLeTu. All rights reserved.
//

import Foundation
extension UIScrollView {
    
    func customRefresh(refresh: @escaping () -> Swift.Void) {
        var imageArray = [UIImage]()
        for i in 0..<9 {
            let image = UIImage(named: "\(i)")
            guard let _ = image else { continue }
            imageArray.append(image!)
        }
        let header = MJRefreshGifHeader {
            refresh()
        }
        header?.setImages(imageArray, duration: 0.5, for: .refreshing)
        header?.setImages(imageArray, duration: 0.5, for: .pulling)
        header?.setImages(imageArray, duration: 0.5, for: .willRefresh)
        mj_header = header
    }
    
    func endRefresh() {
        if mj_header.isRefreshing() {
            mj_header.endRefreshing()
        }
    }
}
