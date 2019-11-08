//
//  event.swift
//  CAIProbe
//
//  Created by liyufeng on 2019/10/28.
//  Copyright © 2019 liyufeng. All rights reserved.
//

import Foundation
import Aspects

class ProbeModel: NSObject {
    var userInfo : [String:AnyObject]? = nil
}

class Plan: ProbeModel,Codable {
    var version = ""
    var onceEventDelayTime = 0.0 //单次事件触发延迟事件
    var events = [Event]()
}

class Event: ProbeModel,Codable {
    var type = 0
    var version = ""
    var id = ""
    var classPath = ""
    var selector = ""
    var keyPaths = [KeyPath]()
    
    func handle(info: AspectInfo) -> [String: AnyObject]? {
        var res: [String: AnyObject] = [:]
        for keyPath in keyPaths {
            if let value = keyPath.value(info: info) {
                res[keyPath.id] = value as AnyObject
            }
        }
        if res.count > 0 {
            return res
        }else{
            return nil
        }
    }
}

class KeyPathParser: NSObject,Codable {
    var type = 0 //0普通类型  2类方法
    var index: Int?
    var valueKeyPath: String?
    var className: String?
    var selector: String?
    
    init(type: Int,path: String) {
        self.type = type
        let arr = path.components(separatedBy: ".")
        if type == 0 {
            if arr.count > 0 {
                let first = arr[0]
                if first.count > 0 ,let i = Int(first) {
                    index = i
                    if arr.count > 1 {
                        let sub = arr[1 ..< arr.count]
                        valueKeyPath = sub.joined(separator: ".")
                    }
                }
            }
        }else if type == 1 {
            if arr.count > 1 {
                let first = arr[0]
                let second = arr[1]
                if first.count > 0 && second.count > 0 {
                    className = first
                    selector = second
                    if arr.count > 2 {
                        let sub = arr[2 ..< arr.count]
                        valueKeyPath = sub.joined(separator: ".")
                    }
                }
            }
        }
        super.init()
    }
}

class KeyPath: ProbeModel,Codable {
    var type = 0 //0 普通  1类
    var version = ""
    var id = ""
    var keyPath = ""
    
    var _parser : KeyPathParser?
    var parser : KeyPathParser {
        if let p = _parser {
            return p
        }else{
            _parser = KeyPathParser(type: type, path: keyPath)
        }
        return _parser!
    }
    
    func value(info: AspectInfo?) -> String? {
        if let info = info {
            if let index = parser.index{
                var object: AnyObject? = nil
                if index == 0 {
                    object = info.instance() as AnyObject?
                }else if(index > 0){
                    let count = info.arguments()?.count ?? 0
                    if (index - 1) < count {
                        object = info.arguments()[index - 1] as AnyObject
                    }
                }
                if let object = object {
                    if let valueKey = parser.valueKeyPath {
                        let value = object.value(forKey: valueKey)
                        if let value = value as? NSObjectProtocol {
                            return value.description
                        }
                    }else{
                        if let value = object as? NSObjectProtocol {
                            return value.description
                        }
                    }
                }
            }
        }else{
            if let className = parser.className,
                let selector = parser.selector,
                let cls = NSClassFromString(className)
            {
                let sel = NSSelectorFromString(selector)
                if let object = CAIProbeUtils.object(for: cls, selector: sel, keyPath: parser.valueKeyPath ?? "") {
                    if let value = object as? NSObjectProtocol {
                        return value.description
                    }
                }
            }
        }
        return nil
    }
}

class ProbeLog: ProbeModel {
    var event : Event
    var res : [String:Any]?
    
    init(event: Event, res: [String:Any]?) {
        self.event = event
        self.res = res
        super.init()
    }
}
