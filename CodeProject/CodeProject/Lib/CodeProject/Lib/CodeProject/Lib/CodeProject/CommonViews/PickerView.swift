//
//  PickerView.swift
//  CodeProject
//
//  Created by Apple on 2017/7/4.
//  Copyright © 2017年 WangDaoLeTu. All rights reserved.
//

import UIKit

fileprivate let selfHeigth: CGFloat = 200.0
fileprivate let titelViewColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)

class PickerView: UIView {
    
    private var datePickView: UIPickerView!
    fileprivate var sourceArray = [Any]()
    fileprivate var select: ((Any) -> ())?
    
    convenience init(array: [String], selectItem: ((Any) -> ())?) {
        self.init()
        self.frame = CGRect(x: 0, y: screen_heigh - selfHeigth, width: screen_width, height: selfHeigth)
        sourceArray = array
        configPcikView()
        configTitleView()
        select = selectItem
    }
    
    private func configPcikView() {
        
        datePickView = UIPickerView(frame: CGRect(x: 0, y: 50, width: screen_width, height: selfHeigth - 50.0))
        datePickView.backgroundColor = UIColor.white
        datePickView.delegate = self
        datePickView.dataSource = self
        datePickView.showsSelectionIndicator = true
        
        addSubview(datePickView)
    }
    private func configTitleView() {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.width, height: 50))
        view.backgroundColor = titelViewColor
        
        let cancle = createButton(frame: CGRect(x: 10, y: 10, width: 40, height: 40),title:"取消")
        let sure = createButton(frame: CGRect(x: screen_width - 50, y: 10, width: 40, height: 40),title:"确定")
        
        addSubview(view)
        view.addSubview(sure)
        view.addSubview(cancle)
    }
    
    private func createButton(frame: CGRect, title: String) -> UIButton  {
        let btn = UIButton(type: .system)
        btn.frame = frame
        btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        return btn
    }
    
    private func createLayerView() -> UIView {
        let view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: screen_width, height: screen_heigh - self.height))
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.2952696918)
        view.alpha = 0
        view.tag = 7777777
        UIApplication.shared.keyWindow?.addSubview(view)
        return view
    }
    
    @objc private func btnClick() {
        dismiss()
    }
    
    func show() {
        let v = createLayerView()
        UIApplication.shared.keyWindow?.addSubview(self)
        UIView.animate(withDuration: 0.3, animations: {
            self.y = screen_heigh - CGFloat(selfHeigth)
            v.alpha = 1
        }) { (complete) in
        }
    }
    
    func dismiss() {
        let v = UIApplication.shared.keyWindow?.viewWithTag(7777777)
        UIView.animate(withDuration: 0.3, animations: {
            self.y = screen_heigh
            v?.alpha = 0
        }) { (complete) in
            self.removeFromSuperview()
            v?.removeFromSuperview()
        }
    }
}
extension PickerView: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        for view in pickerView.subviews {
            if view.height <= 2 {
                view.backgroundColor = #colorLiteral(red: 0.8705882353, green: 0.8705882353, blue: 0.8705882353, alpha: 1)
            }
        }
        return sourceArray.count
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        
        return 40
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let p = PickReuseView()
        p.configData(data: sourceArray[row])
        return p
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        select?(sourceArray[row])
    }
}

class PickReuseView: UIView {
    
    var lable: UILabel?
    override init(frame: CGRect) {
        super.init(frame: frame)
        if lable == nil {
            lable = UILabel(frame: CGRect(x: 20, y: 10, width: 200, height: 20))
            addSubview(lable!)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configData(data: Any) {
        //lable?.text = data
    }
}

