//
//  NetworkViewController.swift
//  WoodPeckerSwiftDemo
//
//  Created by xiaogang zhang on 2018/1/21.
//  Copyright © 2018年 lifebetter. All rights reserved.
//

import UIKit

class NetworkViewController: UIViewController,NSURLConnectionDataDelegate,URLSessionDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func startRequest(_ sender: Any) {
        //url connection
        let requestURL = URL.init(string: "https://api.github.com")
        let request = URLRequest.init(url: requestURL!)
        let connection = NSURLConnection.init(request: request, delegate: self)
        connection?.start()
        //session request
        self.sessionRequest()
    }

    func sessionRequest(){
        let config  = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 10.0
        let mySession = URLSession.init(configuration: config, delegate: self, delegateQueue: OperationQueue.main)
        let url = "https://api.github.com/emojis"
        let requestURL = URL.init(string: url)
        let uploadRequest = NSMutableURLRequest.init(url: requestURL!)
        uploadRequest.httpMethod = "POST"
        let formText = "q=\(arc4random())"
        let data = formText.data(using: String.Encoding.utf8)
        let task = mySession.uploadTask(with: uploadRequest as URLRequest, from: data) { (data:Data?, response:URLResponse?, error:Error?) in
        }
        task.resume()
    }
    
    func connection(_ connection: NSURLConnection, willSend request: URLRequest, redirectResponse response: URLResponse?) -> URLRequest? {
        return request
    }
    
    func connection(_ connection: NSURLConnection, didReceive response: URLResponse) {
        
    }
    
    func connection(_ connection: NSURLConnection, didSendBodyData bytesWritten: Int, totalBytesWritten: Int, totalBytesExpectedToWrite: Int) {
        
    }

    func connection(_ connection: NSURLConnection, didReceive data: Data) {
        
    }
    
    func connectionDidFinishLoading(_ connection: NSURLConnection) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}






