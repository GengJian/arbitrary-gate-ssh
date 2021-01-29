//
//  AirportViewModel.swift
//  ArbitraryGateSSH
//
//  Created by Soul on 2021/1/29.
//  Copyright © 2021 wzsm.io. All rights reserved.
//

import Cocoa
import Alamofire

enum TestDomainUrl : String {
    case CustomURL  = "Custom (Please fill in the input box below)"
    case Facebook   = "https://www.facebook.com"
    case Google     = "https://www.google.com"
    case Instagram  = "https://www.instagram.com/"
    case Twitter    = "https://www.twitter.com"
}

/// 设置页面的数据源
class AirportViewModel: NSObject {
    
    /// 支持测试的域名列表
    lazy var testDomainList: [TestDomainUrl] = {
        let _testDomainList = [
            TestDomainUrl.Google,
            TestDomainUrl.Facebook,
            TestDomainUrl.Twitter,
            TestDomainUrl.Instagram,
            TestDomainUrl.CustomURL,
        ]
        return _testDomainList
    }()
    
    /// 模拟Get请求，测试是否有返回
    /// - Parameter urlString: 域名地址
    func requestGet(urlString: String) {
        let dataRequest: DataRequest = AF.request(urlString,
                                                  method: .get,
                                                  encoding: URLEncoding.default,
                                                  headers: [:])
        dataRequest.responseData { (response) in
            debugPrint(response)
            NotificationCenter.default.post(name: kShowLogNotificationName,
                                            object: "\(response)")
        }
    }
    
}
