//
//  LogOutputController.swift
//  ArbitraryGateSSH
//
//  Created by Soul on 2021/1/29.
//  Copyright © 2021 wzsm.io. All rights reserved.
//

import Cocoa

class LogOutputController: NSViewController {
    
    @IBOutlet var textView: NSTextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        self.textView.isEditable = false
        
        self.show(log: "✈️ Welcome to wenzhou airport ")
        
    }
    
    func show(log newstr: String) -> Void {
        
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "【YYYY-MM-dd HH:mm:ss】"// 自定义时间格式
        let now = dateformatter.string(from: Date())
        
        let resLog = self.textView.string
            .appending("\n")
            .appending(now)
            .appending("\n")
            .appending(newstr)
            .appending("\n")
    
        self.textView.string = resLog
        // 日志自动滚动到最底部
//        let range = resLog.range(of: newstr)
//        let nsrange = NSRange.init(resLog, in: resLog)
        self.textView.scrollRangeToVisible(NSRange.init(location: newstr.count-1, length: 1))
        
    }
    
}
