//
//  PayManager.swift
//  CodeProject
//
//  Created by Apple on 2017/7/4.
//  Copyright © 2017年 WangDaoLeTu. All rights reserved.
//

import UIKit

class PayManager: NSObject,WXApiDelegate {
    
    var successAction : (()->())!
    static let instance : PayManager = PayManager()
    
    class func transformOrderParamterFormAlipay(_ data:[AnyHashable: Any]!)-> NSMutableDictionary? {
        let dic = NSMutableDictionary()
        let resultStatus = data["resultStatus"] as! String
        let result = data["result"] as! NSString
        if resultStatus == "9000" {
            let paramter = result.components(separatedBy: "&")
            for parStr in paramter {
                if parStr.contains("sign=") {
                    let arr = parStr.components(separatedBy: "sign=")
                    dic.setObject((arr.last! as NSString).replacingOccurrences(of: "\"", with: ""), forKey: "sign" as NSCopying)
                } else {
                    var arr = parStr.components(separatedBy: "=")
                    dic.setObject((arr[1]as NSString).replacingOccurrences(of: "\"", with: ""), forKey: arr[0] as NSCopying)
                }
            }
            
            if dic["success"] as! String == "true" {
                if (instance.successAction != nil) {
                    instance.successAction()
                }
                return dic
            }
        }
//        let alert = LDYAlertView()
//        alert.showAlert(withTitle: "提示", message: "支付取消，请重新支付", sureTitle: "确定")
//        alert.clickAction = { _ in
//            
//        }
        //alert.showAlertView()
        return nil
    }
    
    func onResp(_ resp: BaseResp!) {
        if resp is PayResp{
            var alertMsg: String?
            switch resp.errCode {
            case WXSuccess.rawValue:
                alertMsg = nil
                if (successAction != nil) {
                    successAction()
                }
                break
            case WXErrCodeUserCancel.rawValue:
                alertMsg = "用户已取消支付！"
            case WXErrCodeSentFail.rawValue:
                alertMsg = resp.errStr ?? "发送失败 "
            case WXErrCodeAuthDeny.rawValue:
                alertMsg = resp.errStr ?? "授权失败"
            case WXErrCodeUnsupport.rawValue:
                alertMsg = resp.errStr ?? "微信不支持"
            case WXErrCodeCommon.rawValue:
                alertMsg = resp.errStr ?? "未知错误"
            default:
                alertMsg = resp.errStr ?? "未知错误"
            }
            if let _ = alertMsg {
                //let alert = LDYAlertView()
//                alert.showAlert(withTitle: "提示", message: "支付取消，请重新支付", sureTitle: "确定")
//                alert.clickAction = { _ in
//                    
//                }
//                alert.showAlertView()
            }
        }
    }
    func pay(response:Any) {
        let payType = ""
        let info = (response as! Dictionary<String,Any>)["object"] as! Dictionary<String,Any>
        if payType == "WxPay" {
            if !WXApi.isWXAppInstalled() {
               // AlertUtil.showAlert(withText: "您还没有安装微信！")
                return
            }
            let re = PayReq()
            re.partnerId = info["partnerId"] as! String
            re.prepayId = info["prepayId"] as! String
            re.nonceStr = info["nonceStr"] as! String
            re.timeStamp = UInt32(info["timeStamp"] as! String)!
            re.package = info["packageValue"] as! String
            re.sign = info["sign"] as! String
            WXApi.send(re)
            self.successAction = {
                //self.paySuccess()
            }
        } else {
            AlipaySDK.defaultService().payOrder(info["parameters"] as! String, fromScheme: "alipayJourneyBySelfDriving", callback: { resultDic in
                let dic = PayManager.transformOrderParamterFormAlipay(resultDic)
                if let _ = dic {
                   // self.paySuccess()
                } else {
                   // self.payFailure()
                }
            })
            self.successAction = {
                //self.paySuccess()
            }
        }
    }


}
