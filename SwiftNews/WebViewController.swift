//
//  WebViewController.swift
//  SwiftNews
//
//  Created by PxP_ss on 2014/07/26.
//  Copyright (c) 2014年 A.Akira. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate {
    var webView: UIWebView = UIWebView()
    var strUrl: NSString = NSString()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationController.navigationBar.tintColor = .whiteColor()
        self.navigationController.navigationBar.barTintColor = .orangeColor()
        
        self.webView.frame = self.view.bounds
        self.webView.delegate = self
        self.view.addSubview(self.webView)
        
        var url: NSURL = NSURL.URLWithString(strUrl)
        var urlRequest: NSURLRequest = NSURLRequest(URL: url)
        self.webView.loadRequest(urlRequest)
    }
    
    func webView(webView: UIWebView!, shouldStartLoadWithRequest request: NSURLRequest!, navigationType: UIWebViewNavigationType) -> Bool {
        
        return true
    }
    
}