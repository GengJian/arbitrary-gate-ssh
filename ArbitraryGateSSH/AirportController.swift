//
//  AirportController.swift
//  ArbitraryGateSSH
//
//  Created by Soul on 2021/1/29.
//  Copyright © 2021 wzsm.io. All rights reserved.
//

import Cocoa

/// 设置主页面 -> 机场
class AirportController: NSViewController, NSComboBoxDataSource, NSComboBoxDelegate {
    
    // MARK: - 控件属性
    @IBOutlet weak var selectDomainComboBox: NSComboBox!
    
    // MARK: - 数据属性
    let viewModel = AirportViewModel.init()
    
    // MARK: - LifeCycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        self.selectDomainComboBox.dataSource = self
        self.selectDomainComboBox.delegate = self
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    // MARK: - Action Method
    @IBAction func actionConfirmSetting(_ sender: Any) {
        self.postMessage(message: "👷 确认设置")
    }
    
    @IBAction func actionTestDomain(_ sender: Any) {
        self.postMessage(message: "👷 测试域名")
        self.viewModel.requestGet(urlString: "https://www.baidu.com/")
    }
    
    // MARK: - NSComboBox DataSource & Delegate
    func numberOfItems(in comboBox: NSComboBox) -> Int {
        if comboBox == self.selectDomainComboBox {
            return self.viewModel.testDomainList.count
        }
        return 0
    }
    
    func comboBox(_ comboBox: NSComboBox, objectValueForItemAt index: Int) -> Any? {
        if comboBox == self.selectDomainComboBox {
            let type = self.viewModel.testDomainList[index]
            return type.rawValue
        }
        
        return ""
    }
    
    func comboBoxSelectionDidChange(_ notification: Notification) {
        // 复选框完成后更新测试链接至viewmodel
        
    }
    
    // MARK: - Private Method
    func postMessage(message: String) -> Void {
        guard message.count > 0 else {
            return
        }
        
        debugPrint(message)
        NotificationCenter.default.post(name: kShowLogNotificationName,
                                        object: message)
        
    }
    
}
