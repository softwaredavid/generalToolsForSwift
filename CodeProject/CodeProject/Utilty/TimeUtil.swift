//
//  TimeUtil.swift
//  CodeProject
//
//  Created by Apple on 2017/7/4.
//  Copyright © 2017年 WangDaoLeTu. All rights reserved.
//

import UIKit

class TimeUtil: NSObject {
    
    // MARK: ------倒计时
    private var t: DispatchSourceTimer?
    
    func timeDown(second: Int, excue: @escaping ((Int) -> ()), end: @escaping (() -> ())) {
        func stop() {
            t?.cancel()
            t = nil
        }
        if t != nil { stop() }
        var s = second
        let quene = DispatchQueue.global(qos: .default)
        t = DispatchSource.makeTimerSource(queue: quene)
        t!.scheduleRepeating(deadline: .now() + 1, interval: .seconds(1))
        t!.setEventHandler {
            if s == 0 { end(); stop(); return }
            s -= 1
            DispatchQueue.main.async {
                excue(s)
            }
        }
        t!.resume()
    }
}
