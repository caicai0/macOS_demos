//
//  AopManager.swift
//  CAIProbe
//
//  Created by liyufeng on 2019/10/28.
//  Copyright © 2019 liyufeng. All rights reserved.
//

import Foundation
import Aspects

protocol AopManangerDelegate {
    func afterInvocation(info: AspectInfo,userInfo: Any)
}

class AopManager {
    static let share = AopManager()
    var tokens = [AspectToken]()
    var delegate: AopManangerDelegate? = nil
    
    func removeAllTokens() {
        for token in tokens {
            token.remove()
        }
        tokens.removeAll()
    }
    
    func addAop(cls: String,sel: String, userInfo: Any) {
        if let aclass = NSClassFromString(cls){
            let selector = NSSelectorFromString(sel)
            do{
                let block: @convention(block) (AnyObject) -> Void = {
                    info in
                    if let aspectInfo = info as? AspectInfo {
                        DispatchQueue.global().async {
                            self.afterInvocation(info: aspectInfo, userInfo: userInfo)
                        }
                    }
                }
                let token = try aclass.aspect_hook(selector, with: [], usingBlock:block)
                self.tokens.append(token)
            }catch{
                print(error)
            }
        }
    }
    
    func afterInvocation(info: AspectInfo, userInfo: Any) {
        if let delegate = delegate {
            delegate.afterInvocation(info: info, userInfo: userInfo)
        }
    }
}
