//
//  SelectPhoto.swift
//  CodeProject
//
//  Created by Apple on 2017/7/4.
//  Copyright © 2017年 WangDaoLeTu. All rights reserved.
//

import UIKit

class SelectPhoto: NSObject,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    private var image: UIImagePickerController!
    private var selectImage: ((UIImage) -> ())?
    
    override init() {
        super.init()
        image = UIImagePickerController()
        image.delegate = self
    }
    
    func show(controller: UIViewController, type: UIImagePickerControllerSourceType,selectImage: ((UIImage) -> ())?) {
        if !UIImagePickerController.isSourceTypeAvailable(type) {
            print("您为允许该权限，请打开相关权限")
            return
        }
        self.selectImage = selectImage
        image.sourceType = type
        controller.present(image, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])  {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        selectImage?(image)
        picker.dismiss(animated: true, completion: nil)
    }
}
