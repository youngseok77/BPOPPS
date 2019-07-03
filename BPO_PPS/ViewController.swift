//
//  ViewController.swift
//  BPO_PPS
//
//  Created by youngseok Kim on 01/07/2019.
//  Copyright © 2019 ziinsoft. All rights reserved.
//

import UIKit
import AVFoundation
import WebKit
import CoreLocation
import MapKit
import AdSupport
import Foundation
class ViewController: UIViewController , AVCaptureMetadataOutputObjectsDelegate,
WKNavigationDelegate, WKUIDelegate, WKScriptMessageHandler, CLLocationManagerDelegate, UIScrollViewDelegate{
    
    static var vc: ViewController!
    static var webView: WKWebView!
    let autoLoginView = "pw.do"
    
    override func loadView() {
        super.loadView()
        webInit()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webLoad()
    }

    //웹뷰 화면 초기화
    func webInit(){
        let contentController = WKUserContentController();
        let userScript = WKUserScript(
            source: "NfcReadedReturn()",
            injectionTime: WKUserScriptInjectionTime.atDocumentEnd,
            forMainFrameOnly: true
        )
        
        contentController.addUserScript(userScript)

        
        contentController.add(
            self,
            name: "appSetLogIn"
        )
        
        let config = WKWebViewConfiguration()
        config.userContentController = contentController
        config.preferences.javaScriptEnabled = true
        config.preferences.javaScriptCanOpenWindowsAutomatically = true
        let screenSize: CGRect = UIScreen.main.bounds
        
        ViewController.webView = WKWebView(frame: screenSize, configuration: config)
        ViewController.webView.uiDelegate = self
        ViewController.webView.navigationDelegate = self
    }
    
    //웹 로드
    func webLoad(){
        ViewController.vc = self
        self.view.addSubview(ViewController.webView!)
        let initUrl = "http://\(AppInfos.shared.devServerIp):\(AppInfos.shared.devPort)\(AppInfos.shared.contextPath)\(autoLoginView)"
        let myUrl = URL(string:initUrl)
        let myRequest = URLRequest(url:myUrl!)
        ViewController.webView!.load(myRequest)
        ViewController.webView!.allowsBackForwardNavigationGestures = false
       // ViewController.webView!.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        
        
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print("test")
    }
}

