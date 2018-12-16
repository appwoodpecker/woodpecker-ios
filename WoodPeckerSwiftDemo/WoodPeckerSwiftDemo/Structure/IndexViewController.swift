//
//  IndexViewController.swift
//  WoodPeckerSwiftDemo
//
//  Created by xiaogang zhang on 2018/1/20.
//  Copyright © 2018年 lifebetter. All rights reserved.
//

import UIKit

class IndexViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var actionList: [[String:Any]]?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Woodpecker Demo";
        self.tableView.rowHeight = 60.0;
        self.loadData()
    }

    
    func loadData() {
        self.actionList = [
                [
                "title" : "Sandbox",
                "action" : #selector(IndexViewController.sandBox)
                ],
                [
                "title" : "Network",
                "action" : #selector(IndexViewController.network)
                ],
                [
                "title" : "I/O",
                "action" : #selector(IndexViewController.doIO)
                ],
                [
                "title" : "Web Console",
                "action" : #selector(IndexViewController.webConsole)
                ],
                [
                    "title" : "More tools",
                    "action" : #selector(IndexViewController.more)
                ]
        ]
    }
    
    @objc func sandBox(){
        let vc = SandBoxViewController()
        self.navigationController!.pushViewController(vc, animated: true)
    }
    

    @objc func network(){
        let vc = NetworkViewController()
        self.navigationController!.pushViewController(vc, animated:true)
    }
    
 
    @objc func doIO(){
        let vc = IOViewController()
        self.navigationController!.pushViewController(vc, animated:true)
    }
    
    @objc func webConsole(){
        let vc = WebConsoleViewController()
        self.navigationController!.pushViewController(vc,animated:true)
    }
    
    @objc func more(){
        let message = "You can learn more in the Objective-C demo";
        let alert = UIAlertController.init(title: "Alert", message: message, preferredStyle: UIAlertControllerStyle.alert);
        let confirm = UIAlertAction.init(title: "Ok", style: UIAlertActionStyle.default) { (action) in
            
        }
        alert.addAction(confirm);
        self.present(alert, animated: true, completion: nil);
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = self.actionList!.count
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let kIndexCellIdentifier = "kIndexCellIdentifier"
        let cell = tableView.dequeueReusableCell(withIdentifier: kIndexCellIdentifier) ?? UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: kIndexCellIdentifier)
        var data = self.actionList![indexPath.row]
        let title = data["title"];
        cell.textLabel?.text = (title as! String)
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var data = self.actionList![indexPath.row];
        let action = data["action"]
        self.perform(action as? Selector)
        tableView.deselectRow(at: indexPath, animated: false)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}














