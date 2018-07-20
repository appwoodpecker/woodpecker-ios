//
//  WebContentViewController.swift
//  WoodPeckerSwiftDemo
//
//  Created by xiaogang zhang on 2018/1/21.
//  Copyright © 2018年 lifebetter. All rights reserved.
//

import UIKit
import WebKit

class WebContentViewController: UIViewController,WKUIDelegate
{

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
            wkWebView.uiDelegate = self;
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
    
/// uidelegate (Alert,Confirm support)
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Swift.Void)
    {
        let alert = UIAlertController.init(title: "Alert", message: message, preferredStyle: UIAlertControllerStyle.alert);
        let confirm = UIAlertAction.init(title: "Ok", style: UIAlertActionStyle.default) { (action) in
            completionHandler();
        }
        alert.addAction(confirm);
        self.present(alert, animated: true, completion: nil);
    }
    
    
    public func webView(_ webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping (Bool) -> Swift.Void)
    {
        let alert = UIAlertController.init(title: "Alert", message: message, preferredStyle: UIAlertControllerStyle.alert);
        let cancel = UIAlertAction.init(title: "Cancel", style: UIAlertActionStyle.default) { (action) in
            completionHandler(false);
        }
        let confirm = UIAlertAction.init(title: "Ok", style: UIAlertActionStyle.default) { (action) in
            completionHandler(true);
        }
        alert.addAction(cancel);
        alert.addAction(confirm);
        self.present(alert, animated: true, completion: nil);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}









