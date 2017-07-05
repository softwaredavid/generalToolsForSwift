//
//  QRCodeViewController.swift
//  CodeProject
//
//  Created by Apple on 2017/7/5.
//  Copyright © 2017年 WangDaoLeTu. All rights reserved.
//

import UIKit
import AVFoundation

class QRCodeViewController: UIViewController {
    
    private lazy var customContainerView: UIView? = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    private lazy var session: AVCaptureSession = AVCaptureSession()
    private lazy var scanLineView: UIImageView = UIImageView()
    
    /// 输出对象
    private lazy var output: AVCaptureMetadataOutput = AVCaptureMetadataOutput()
    
    /// 预览图层
    fileprivate lazy var previewLayer: AVCaptureVideoPreviewLayer = AVCaptureVideoPreviewLayer(session: self.session)
    
    /// 专门用于保存描边的图层
    fileprivate lazy var containerLayer: CALayer = CALayer()
    
    private lazy var input: AVCaptureDeviceInput? = {
        let device = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        return try? AVCaptureDeviceInput(device: device)
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configpara()
        
    }
    
    private func configpara() {
        guard let _ = customContainerView else { return }
        customContainerView?.center = view.center
        scanLineView.frame = CGRect(x: 0, y: 0, width: customContainerView!.width, height: customContainerView!.height)
        customContainerView?.addSubview(scanLineView)
        
        let viewRect = view.frame
        let x = customContainerView!.y / viewRect.height;
        let y = customContainerView!.x / viewRect.width;
        let width = customContainerView!.height / viewRect.height;
        let height = customContainerView!.width / viewRect.width;
        // 设置输出对象解析数据时感兴趣的范围
        output.rectOfInterest = CGRect(x: x, y: y, width: width, height: height)
    }
    
    private func scanQRCode() {
        if !session.canAddInput(input) { return }
        if !session.canAddOutput(output) { return }
        session.addInput(input)
        session.addOutput(output)
        
        // 设置数据类型一定要在输出对象添加到会话之后才能设置
        output.metadataObjectTypes = output.availableMetadataObjectTypes
        
        output.setMetadataObjectsDelegate(self as AVCaptureMetadataOutputObjectsDelegate, queue: DispatchQueue.main)
        
        view.layer.insertSublayer(previewLayer, at: 0)
        previewLayer.frame = view.bounds

        view.layer.addSublayer(containerLayer)
        containerLayer.frame = view.bounds
        session.startRunning()
    }
}

extension QRCodeViewController: AVCaptureMetadataOutputObjectsDelegate
{
    /// 只要扫描到结果就会调用
     func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
        // 1.显示结果
        //customLabel.text =  metadataObjects.last?.stringValue
        
        clearLayers()
        // 2.拿到扫描到的数据
        guard let metadata = metadataObjects.last as? AVMetadataObject else { return }
        // 通过预览图层将corners值转换为我们能识别的类型
        let objc = previewLayer.transformedMetadataObject(for: metadata)
        // 2.对扫描到的二维码进行描边
        drawLines(objc: objc as! AVMetadataMachineReadableCodeObject)
    }
    
    private func drawLines(objc: AVMetadataMachineReadableCodeObject) {

        guard let array = objc.corners else { return }
        
        let layer = CAShapeLayer()
        layer.lineWidth = 2
        layer.strokeColor = UIColor.green.cgColor
        layer.fillColor = UIColor.clear.cgColor
        
        let path = UIBezierPath()
        var index = 0
        index += 1
        let cfDic = array[index] as! CFDictionary
        var point = CGPoint(dictionaryRepresentation: cfDic)
        
        // 2.1将起点移动到某一个点
        path.move(to: point!)
        
        // 2.2连接其它线段
        while index < array.count {
            
            let cfDic = array[index] as! CFDictionary
            point = CGPoint(dictionaryRepresentation: cfDic)
            path.addLine(to: point!)
        }
        // 2.3关闭路径
        path.close()
        
        layer.path = path.cgPath
        // 3.将用于保存矩形的图层添加到界面上
        containerLayer.addSublayer(layer)
    }
    
    /// 清空描边
    private func clearLayers() {
        guard let subLayers = containerLayer.sublayers else { return }
        for layer in subLayers {
            layer.removeFromSuperlayer()
        }
    }
}
