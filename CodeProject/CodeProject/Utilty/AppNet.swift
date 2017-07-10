//
//  AppNet.swift
//  CodeProject
//
//  Created by Apple on 2017/6/28.
//  Copyright © 2017年 WangDaoLeTu. All rights reserved.
//
/**
 ["Authorization":"bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOlsiYXBpIl0sInNjb3BlIjpbInJlYWQiLCJ3cml0ZSJdLCJleHAiOjE1MDEzMDA1ODEsImF1dGhvcml0aWVzIjpbIlJPTEVfVFJVU1RFRF9DTElFTlQiLCJST0xFX0NMSUVOVCJdLCJqdGkiOiJjNDhmMDA3Ny01MzgzLTQzMjktYmUyOS05MWQzZTc1OTk5MTUiLCJjbGllbnRfaWQiOiJ3ZGx0LWNsaWVudC10cmF2ZWwtZ3VpZGUifQ.ldYCjoJ7k2CPMhtcW5gbExKFKTUYQ-yFJCSgtU-020o"]
 userName: "wdlt-client-travel-guide"
 password: "1a2730fc771f359db9ebe14b45b02705"
 
 mulitiData.append(<#T##data: Data##Data#>, withName: <#T##String#>, fileName: <#T##String#>, mimeType: <#T##String#>)
 
 */


import UIKit
import Alamofire

struct UploadFile {
    var data: Data!
    var name: String!
    var fileName: String!
    var mimeType: String!
}

class AppNet: NSObject {
    
    // MARK: == get请求
    static func get(url: String!, paras:[String:String]? = nil, header:[String : String]? = nil, success: @escaping(Any) -> Swift.Void) {
        
        Alamofire.request(url, method: .get, parameters: paras, encoding: URLEncoding.default, headers: header).responseJSON { response in
            parseData(result: response, success: success)
        }
        
    }
    
    // MARK: == get请求加Author验证
    static func getAuthorization(url: String!, paras:[String:String]? = nil, header:[String : String]? = nil, userName: String? = "", passWord: String? = "",success: @escaping (Any) -> Swift.Void) {
        
        Alamofire.request(url, method: .get, parameters: paras, encoding: URLEncoding.default, headers: header).authenticate(user: userName!, password: passWord!).responseJSON { response in
            parseData(result: response, success: success)
        }
    }
    
    // MARK: == post请求
    static func post(url: String!, paras:[String:String]? = nil, header:[String : String]? = nil, success: @escaping(Any) -> ()) {
        
        Alamofire.request(url, method: .post, parameters: paras, encoding: URLEncoding.default, headers: header).responseJSON { response in
            parseData(result: response, success: success)
        }
    }
    
    // MARK: == post请求加Author验证
    static func postAuthorization(url: String!, paras:[String:String]? = nil, header:[String : String]? = nil, userName: String? = "", passWord: String? = "",success: @escaping(Any) -> Swift.Void) {
        
        Alamofire.request(url, method: .post, parameters: paras, encoding: URLEncoding.default, headers:  header)
            .authenticate(user: userName!, password: passWord!)
            .responseJSON { response in
                parseData(result: response, success: success)
        }
    }
    
    // MARK: == 上传文件
    static func upload(url: String!, paras:[UploadFile]? = nil, otherPara:[String : String]? = nil,header:[String : String]? = nil,userName: String? = "", passWord: String? = "", success: @escaping(Any) -> ()) {
        Alamofire.upload(multipartFormData: { (data) in
            if paras != nil {
                for item in paras! {
                    data.append(item.data, withName: item.name, fileName: item.fileName, mimeType: item.mimeType)
                }
            }
            if otherPara != nil {
                for (key, item) in otherPara! {
                    let d = item.data(using: .utf8, allowLossyConversion: false)
                    data.append(d!, withName: key)
                }
            }
        }, usingThreshold: SessionManager.multipartFormDataEncodingMemoryThreshold, to: url, method: .post, headers: header, encodingCompletion: { (result) in
            
            switch result {
            case .success(let upload, _, _):
                upload.authenticate(user: userName!, password: passWord!)
                    .responseJSON(completionHandler: { (response) in
                    parseData(result: response, success: success)
                })
             case .failure( _): break
            }
        })
    }
    // MARK: == 解析数据
    private static func parseData(result: DataResponse<Any>, success: (Any) -> Swift.Void) {
        guard let code = result.response?.statusCode else { return }
        guard let data = result.result.value else { return }
        switch code {
        case 200: success(data)
        case 404: debugPrint("找不到请求路径")
        case 500: debugPrint("解析错误数据")
        default : debugPrint("解析错误数据")
        }
    }
    
}

