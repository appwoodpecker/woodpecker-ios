//
//  IOViewController.swift
//  WoodPeckerSwiftDemo
//
//  Created by xiaogang zhang on 2018/1/21.
//  Copyright © 2018年 lifebetter. All rights reserved.
//

import UIKit



class IOViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //register custom service
        ADHOrganizer.shared().registerService(EchoService.classForCoder())
    }
    
    @IBAction func logButtonPressed(_ sender: Any) {
        let text = "A channel between mac and your app, you can transfer data, call service in you app, or log message to mac client,  try log something, or you create a custom ADHService"
        // log to mac
        ADHLogger.shared().logText(text)
    }

}
















