//
//  SandBoxViewController.swift
//  WoodPeckerSwiftDemo
//
//  Created by xiaogang zhang on 2018/1/20.
//  Copyright © 2018年 lifebetter. All rights reserved.
//

import UIKit

class SandBoxViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addFileButtonPressed(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = Date()
        let text = formatter.string(from: date)
        //file name
        formatter.dateFormat = "HH-mm-ss"
        let fileName = "\(formatter.string(from: date)).txt"
        let documentPath = (NSHomeDirectory() as NSString).appendingPathComponent("Documents")
        let filePath = (documentPath as NSString).appendingPathComponent(fileName)
        let fileURL = NSURL.fileURL(withPath: filePath)
        
        do {
            try text.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
        } catch  {
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}







