//
//  AppDelegate.swift
//  WoodpeckerMacDemo
//
//  Created by xiaogang zhang on 2019/6/1.
//  Copyright © 2019 LIFE BETTER. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var tabView: NSTabView!
    
    var list : Array<Dictionary<String, String>>?
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        initValue()
        loadContent()
    }
    
    func initValue() {
        self.list = [
            [
                "title" : "Sandbox",
                "page" : "SandboxViewController"
            ],
            [
                "title" : "UserDefaults",
                "page" : "UserDefaultsViewController"
            ],
            [
                "title" : "Network",
                "page" : "NetworkViewController"
            ],
            [
                "title" : "Bundle",
                "page" : "BundleViewController"
            ],
            [
                "title" : "Notification",
                "page" : "NotificationViewController"
            ],
            [
                "title" : "Localization",
                "page" : "LocalizationViewController"
            ],
        ];
    }
    
    func loadContent() {
        var tabItems = [NSTabViewItem]()
        for data in self.list! {
            let title = data["title"]
            let page = data["page"]
            let nibName = page
            let clazz = getClass(pageName:page!)
            let vc = clazz.init(nibName: nibName, bundle: nil)
            vc.title = title
            let tabItem = NSTabViewItem.init(viewController: vc)
            tabItems.append(tabItem)
        }
        self.tabView.tabViewItems = tabItems
    }

    func getClass(pageName: String) -> NSViewController.Type {
        let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        let clazzName = namespace + "." + pageName;
        let clazz = NSClassFromString(clazzName) as! NSViewController.Type
        return clazz;
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }


}

