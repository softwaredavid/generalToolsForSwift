//
//  UIImage+Extension.swift
//  CodeProject
//
//  Created by Apple on 2017/7/6.
//  Copyright © 2017年 WangDaoLeTu. All rights reserved.
//

import Foundation
extension UIImage {
   // MARK: 保存图片到相册
    func saveImageToPhotosAlbum() {
        UIImageWriteToSavedPhotosAlbum(self, self, #selector(image(image:didFinishSavingWithError:contextInfo:)), nil)
    }
    // MARK: 保存结果回调
    func image(image:UIImage, didFinishSavingWithError:NSError?, contextInfo: AnyObject?) {
        if didFinishSavingWithError != nil {
            //保存成功
        } else {
            //保存失败
        }
    }
}
