//
//  HomeViewController.swift
//  CodeProject
//
//  Created by Apple on 2017/6/26.
//  Copyright © 2017年 WangDaoLeTu. All rights reserved.
//
/**
 ["Authorization":"bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiYXBpIl0sInNjb3BlIjpbInJlYWQiLCJ3cml0ZSJdLCJleHAiOjE1MDEzMDA1ODEsImF1dGhvcml0aWVzIjpbIlJPTEVfVFJVU1RFRF9DTElFTlQiLCJST0xFX0NMSUVOVCJdLCJqdGkiOiJjNDhmMDA3Ny01MzgzLTQzMjktYmUyOS05MWQzZTc1OTk5MTUiLCJjbGllbnRfaWQiOiJ3ZGx0LWNsaWVudC10cmF2ZWwtZ3VpZGUifQ.ldYCjoJ7k2CPMhtcW5gbExKFKTUYQ-yFJCSgtU-020o"]
 userName: "wdlt-client-travel-guide"
 password: "1a2730fc771f359db9ebe14b45b02705"
 @{@"mobile":_phoneNumber.text,@"verifyCode":_passWord.text,@"source":@"ios"}
 https://192.168.1.200:9443/api/users/login
 
 @"score":@(_score),@"poiCategoryCode":self.poiCategoryCode,@"content":self.suggestContent.text,@"userId":@(self.userId),@"poiId":@(self.poiId)
 
 */

import UIKit

class HomeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       /* AppNet.getAuthorization(url: "https://192.168.1.200:9443/api/view/home/sliders", paras: nil, header: ["Authorization":"bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiYXBpIl0sInNjb3BlIjpbInJlYWQiLCJ3cml0ZSJdLCJleHAiOjE1MDEzMDA1ODEsImF1dGhvcml0aWVzIjpbIlJPTEVfVFJVU1RFRF9DTElFTlQiLCJST0xFX0NMSUVOVCJdLCJqdGkiOiJjNDhmMDA3Ny01MzgzLTQzMjktYmUyOS05MWQzZTc1OTk5MTUiLCJjbGllbnRfaWQiOiJ3ZGx0LWNsaWVudC10cmF2ZWwtZ3VpZGUifQ.ldYCjoJ7k2CPMhtcW5gbExKFKTUYQ-yFJCSgtU-020o"], userName: "wdlt-client-travel-guide", passWord: "1a2730fc771f359db9ebe14b45b02705") { (response, any) in
                print(response?["sliders"])
        
        }
       AppNet.postAuthorization(url: "https://192.168.1.200:9443/api/users/login", paras: ["mobile":"15037153382","verifyCode":"012357","source":"ios"], header: ["Authorization":"bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiYXBpIl0sInNjb3BlIjpbInJlYWQiLCJ3cml0ZSJdLCJleHAiOjE1MDEzMDA1ODEsImF1dGhvcml0aWVzIjpbIlJPTEVfVFJVU1RFRF9DTElFTlQiLCJST0xFX0NMSUVOVCJdLCJqdGkiOiJjNDhmMDA3Ny01MzgzLTQzMjktYmUyOS05MWQzZTc1OTk5MTUiLCJjbGllbnRfaWQiOiJ3ZGx0LWNsaWVudC10cmF2ZWwtZ3VpZGUifQ.ldYCjoJ7k2CPMhtcW5gbExKFKTUYQ-yFJCSgtU-020o","Content-Type":"application/x-www-form-urlencoded; charset=utf-8"], userName: "wdlt-client-travel-guide", passWord: "1a2730fc771f359db9ebe14b45b02705") { (response, any) in
            
        }
        
        let data = UIImage(named: "4-8_已认证_PxCook.png")
        let d = UIImagePNGRepresentation(data!)
        
        let i = UploadFile.init(data: d, name: "images", fileName: "20170630160426", mimeType: "image/jpg")
        
        AppNet.upload(url: "https://192.168.1.200:9443/api/poi/comment/add", paras: [i], otherPara: ["score":"5","poiCategoryCode":"hotel","content":"Tree","userId":"59","poiId":"28"], header: ["Authorization":"bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiYXBpIl0sInNjb3BlIjpbInJlYWQiLCJ3cml0ZSJdLCJleHAiOjE1MDEzMDA1ODEsImF1dGhvcml0aWVzIjpbIlJPTEVfVFJVU1RFRF9DTElFTlQiLCJST0xFX0NMSUVOVCJdLCJqdGkiOiJjNDhmMDA3Ny01MzgzLTQzMjktYmUyOS05MWQzZTc1OTk5MTUiLCJjbGllbnRfaWQiOiJ3ZGx0LWNsaWVudC10cmF2ZWwtZ3VpZGUifQ.ldYCjoJ7k2CPMhtcW5gbExKFKTUYQ-yFJCSgtU-020o","Content-Type":"application/x-www-form-urlencoded; charset=utf-8"], userName: "wdlt-client-travel-guide", passWord: "1a2730fc771f359db9ebe14b45b02705") { (result) in
            
        }
         AppManager.upgradeApp { (releaseNode, hsNewVersion) in
         
         }
         UIApplication.shared.openURL(URL(string: "https://itunes.apple.com/cn/app/%E4%B9%90%E9%81%93%E6%B8%B8/id1220810675?mt=8")!)
         
         let y = SDCycleScrollView(frame: <#T##CGRect#>, delegate: <#T##SDCycleScrollViewDelegate!#>, placeholderImage: UIImage!)//图片轮播 好用
         
         let config = ConfigItem()
         let content = ["测试","测试","测试","测试","测试"]
         let vi = SudokuView(config: config, frame: CGRect(x: 10, y: 102, width: 200, height: 400),content:content)
         view.addSubview(vi)
         
         vi.clickItem = { inex, title in
         
         
         }
         
         */
        
       let wek =  DateManager.getHoursFromDate(date: Date())
        
        let m = FMDBManager.shareFMDBManager
        m.createTable(name: "appstate")
        //m.updateTable(name: "appstate", key: ["1"], value: ["世界"])
        m.clearTable(name: "appstate")
    }

}
