//
//  OCSSwiftUtils.swift
//  OCShellApp
//
//  Created by 徐冰 on 2024/3/11.
//

import Foundation

// 只有继承NSObject的类可以被OC调用
class OCShellSwiftUtils : NSObject {
    @objc class func logClassMethod(_ info:String) {
        print("\(#function) \(info)")
    }
    
    @objc func logInstanceMethod(_ info:String) {
        print("\(#function) \(info)")
    }
}
