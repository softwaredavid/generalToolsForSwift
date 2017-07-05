//
//  CreateQRCodeViewController.swift
//  CodeProject
//
//  Created by Apple on 2017/7/5.
//  Copyright © 2017年 WangDaoLeTu. All rights reserved.
//

import UIKit

class CreateQRCodeViewController: UIViewController {
    private lazy var customImageVivew: UIImageView = {
        let iamgeView = UIImageView(frame: CGRect(x: 200, y: 200, width: 200, height: 200))
        return iamgeView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        view.addSubview(customImageVivew)
        createQRCode()
    }
    func createQRCode() {
        // 1.创建滤镜
        let filter = CIFilter(name: "CIQRCodeGenerator")
        // 2.还原滤镜默认属性
        filter?.setDefaults()
        // 3.设置需要生成二维码的数据到滤镜中
        // 要求设置的是一个二进制数据
        let data = "OC中要求设置的是一个二进制数据".data(using: .utf8)
        filter?.setValue(data, forKeyPath: "InputMessage")
        
        // 4.从滤镜从取出生成好的二维码图片
        guard let ciImage = filter?.outputImage else { return }
        customImageVivew.image = createNonInterpolatedUIImageFormCIImage(image: ciImage, size: 500)
    }
    
    /**
     生成高清二维码
     
     - parameter image: 需要生成原始图片
     - parameter size:  生成的二维码的宽高
     */
    private func createNonInterpolatedUIImageFormCIImage(image: CIImage, size: CGFloat) -> UIImage {
    
        let extent: CGRect = image.extent.integral
        let scale: CGFloat = min(size/extent.width, size/extent.height)
        
        // 1.创建bitmap;
        let width = extent.width * scale
        let height = extent.height * scale
        let cs: CGColorSpace = CGColorSpaceCreateDeviceGray()
        let bitmapRef = CGContext(data: nil, width: Int(width), height: Int(height), bitsPerComponent: 8, bytesPerRow: 0, space: cs, bitmapInfo: 0)!
        
        let context = CIContext(options: nil)
        let bitmapImage: CGImage = context.createCGImage(image, from: extent)!
        
        bitmapRef.interpolationQuality = CGInterpolationQuality.none
        bitmapRef.scaleBy(x: scale, y: scale);
        bitmapRef.draw(bitmapImage, in: extent)
        
        // 2.保存bitmap到图片
        let scaledImage: CGImage = bitmapRef.makeImage()!
        
        return UIImage(cgImage: scaledImage)
    }

    //MARK: - 根据背景图片和头像合成头像二维码
    private func creatImage(bgImage: UIImage, iconImage:UIImage) -> UIImage{
        
        //开启图片上下文
        UIGraphicsBeginImageContext(bgImage.size)
        //绘制背景图片
        bgImage.draw(in: CGRect(origin: .zero, size: bgImage.size))
        //绘制头像
        let width: CGFloat = 50
        let height: CGFloat = width
        let x = (bgImage.size.width - width) * 0.5
        let y = (bgImage.size.height - height) * 0.5
        iconImage.draw(in: CGRect(x: x, y: y, width: width, height: height))
        //取出绘制好的图片
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        //关闭上下文
        UIGraphicsEndImageContext()
        //返回合成好的图片
        return newImage!
    }
}
