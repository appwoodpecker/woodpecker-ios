//
//  EchoService.swift
//  WoodPeckerSwiftDemo
//
//  Created by 张小刚 on 2018/1/21.
//  Copyright © 2018年 lifebetter. All rights reserved.
//

import UIKit

class EchoService: ADHService {

    override class func serviceName() -> String {
        return "adh.EchoService";
    }
    
    override class func actionList() -> ([String:String]) {
        return ["echo": NSStringFromSelector(#selector(EchoService.onRequestEcho(request:)))]
    }
    
    @objc func onRequestEcho(request: ADHRequest) {
        let data = ["response" : "hi, I`m App, What`s up"]
        request.finish(withBody: data)
    }
    
}
