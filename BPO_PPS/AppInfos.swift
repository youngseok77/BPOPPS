//
//  AppInfos.swift
//  BPO_PPS
//
//  Created by youngseok Kim on 01/07/2019.
//  Copyright © 2019 ziinsoft. All rights reserved.
//

import Foundation
import UIKit

class AppInfos: NSObject {
    static let shared = AppInfos()
    var realServerIp: String = "52.231.164.255"
    var devServerIp: String = "52.231.164.255"
    //var devServerIp: String = "192.168.123.179"
    
    var realPort: String = "8047"
    //var devPort: String = "8080"
    var devPort: String = "8047"
    var contextPath: String = "/SmartCardServer/"
    var loginView: String = "pw.do"
    var loginService: String = "registCustomer.do"
    // http://192.168.123.157:8047/SmartCardServer/main.do
}
