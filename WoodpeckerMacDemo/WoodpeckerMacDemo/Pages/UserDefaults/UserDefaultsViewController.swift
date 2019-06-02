//
//  UserDefaultsViewController.swift
//  WoodpeckerMacDemo
//
//  Created by xiaogang zhang on 2019/6/1.
//  Copyright © 2019 LIFE BETTER. All rights reserved.
//

import Cocoa

class UserDefaultsViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func addButtonClicked(_ sender: Any) {
        UserDefaults.standard.set(Date.init(), forKey: "time")
        UserDefaults.standard.synchronize()
    }
    
}
