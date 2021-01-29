//
//  RadarController.swift
//  ArbitraryGateSSH
//
//  Created by Soul on 2021/1/29.
//  Copyright © 2021 wzsm.io. All rights reserved.
//

import Cocoa

public let kShowLogNotificationName: NSNotification.Name = NSNotification.Name(rawValue: "kShowLogNotificationName")

/// 日志页面 -> 雷达
class RadarController: NSViewController {
    
    @IBOutlet var textView: NSTextView!
    
    deinit {
        // 移除通知
        NotificationCenter.default.removeObserver(self)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        debugPrint("从StoryBoard中加载RadarController...")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        self.textView.isEditable = false
        
        //监听通知
        NotificationCenter.default.addObserver(forName: kShowLogNotificationName,
                                               object: nil,
                                               queue: .main) { (notify) in
            let str = notify.object
            self.show(log: str as! String)
        }
        
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
