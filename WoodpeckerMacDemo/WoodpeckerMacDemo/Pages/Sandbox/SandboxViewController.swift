//
//  SandboxViewController.swift
//  WoodpeckerMacDemo
//
//  Created by xiaogang zhang on 2019/6/1.
//  Copyright © 2019 LIFE BETTER. All rights reserved.
//

import Cocoa

class SandboxViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
   
    }
    
    @IBAction func addButtonClicked(_ sender: Any) {
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
    
}
