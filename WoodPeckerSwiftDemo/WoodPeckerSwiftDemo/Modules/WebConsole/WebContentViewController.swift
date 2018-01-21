//
//  WebContentViewController.swift
//  WoodPeckerSwiftDemo
//
//  Created by 张小刚 on 2018/1/21.
//  Copyright © 2018年 lifebetter. All rights reserved.
//

import UIKit
import WebKit

class WebContentViewController: UIViewController {

    @IBOutlet var contentView: UIView?
    var uiwebView: Bool?
    var webView: UIWebView?
    var wkWebView: WKWebView?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = self.uiwebView! ? "UIWebView" : "WKWebView";
        self.setupWebview()
        self.loadContent()
    }
    
    func setupWebview(){
        let contentView: UIView! = self.contentView
        if(self.uiwebView!){
            let webView = UIWebView()
            webView.frame = contentView.bounds;
            webView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
            contentView.addSubview(webView)
            self.webView = webView
        }else{
            let wkWebView = WKWebView()
            wkWebView.frame = contentView.bounds;
            wkWebView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
            contentView.addSubview(wkWebView)
            self.wkWebView = wkWebView;
        }
    }
    
    func loadContent() {
        URLCache.shared.removeAllCachedResponses()
        let url = "http://www.woodpeck.cn"
        let requestURL = URL.init(string: url)
        let request = URLRequest.init(url: requestURL!)
        if(self.uiwebView!){
            self.webView!.loadRequest(request)
        }else{
            self.wkWebView!.load(request)
        }
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}









