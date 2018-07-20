//
//  WebConsoleViewController.swift
//  WoodPeckerSwiftDemo
//
//  Created by xiaogang zhang on 2018/1/21.
//  Copyright © 2018年 lifebetter. All rights reserved.
//

import UIKit

class WebConsoleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func uiwebviewButtonPressed(_ sender:Any) {
        let vc = WebContentViewController()
        vc.uiwebView = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func wkwebviewButtonPressed(_ sender:Any) {
        let vc = WebContentViewController()
        vc.uiwebView = false
        self.navigationController?.pushViewController(vc, animated: true)
    }


}
