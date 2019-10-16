//
//  MSwiftFiles.swift
//  convertOcModel
//
//  Created by liyufeng on 2019/10/12.
//  Copyright © 2019 liyufeng. All rights reserved.
//

import Foundation

func mAllFiles(path:String,out:String) {
    if let allFiles = findAllFiles(dir: path) {
        for file in allFiles {
            if let res = mfile(filePath: file) {
                let newFilePath = file.replacingOccurrences(of: path, with: out)
                do {
                    try res.write(toFile: newFilePath, atomically: true, encoding: .utf8)
                }catch{
                    print(error)
                }
            }
        }
    }
}

func mfile(filePath : String) -> String? {
    if FileManager.default.fileExists(atPath: filePath) &&
    FileManager.default.isReadableFile(atPath: filePath) &&
    FileManager.default.isWritableFile(atPath: filePath){
        do{
            print("File:\(filePath)")
            let regex = try NSRegularExpression(pattern: "^    var[\\s]+([\\S]+)[\\s]*:[\\s]*([\\S]+)", options: .caseInsensitive)
            
            let source:String = try NSString(contentsOfFile: filePath, encoding: String.Encoding.utf8.rawValue) as String
            var lines = source.split(separator: "\n")
            for i in 0 ..< lines.count {
                let line = lines[i]
                
                let res = regex.matches(in: String(line), options: .reportCompletion, range: NSRange(location: 0, length: line.count))
                if res.count > 0 {
                    lines[i] = Substring(mline(line: String(line)))
                }else{
                    lines[i] = Substring(normalMLine(line: String(line)))
                }
            }
            
            var res = lines.joined(separator: "\n")
            
            //组织文件头
            let fileUrl = URL(fileURLWithPath: filePath)
            let fileName = fileUrl.lastPathComponent
            let header = "//\n" + "//  \(fileName)\n" + "//  JianKangJie3\n" + "//\n" + "//  Created by liyufeng on 2019/10/14.\n" + "//  Copyright © 2019 liyufeng. All rights reserved.\n" + "//\n"
            res = header + res
            
            //删除空行
            while res.range(of: "\n\n") != nil {
                res = res.replacingOccurrences(of: "\n\n", with: "\n")
            }
            
            return res
//            try res.write(toFile: filePath, atomically: true, encoding: .utf8)
        }catch{
            print(error)
        }
    }
    return nil
}

func mline(line:String) -> String {
    var res = line
    if res.hasPrefix("    var ") {
        res = res.replacingOccurrences(of: "    var ", with:"    @objc var ")
    }
    if res.hasSuffix(" String!") {
        res = res.replacingOccurrences(of: " String!", with: " String = \"\"")
    }
    if res.hasSuffix(": String") {
        res = res.replacingOccurrences(of: ": String", with: ": String = \"\"")
    }
    if res.hasSuffix(": BlanceType") {
        res = res.replacingOccurrences(of: ": BlanceType", with: ": BlanceType = .KB")
    }
    if res.hasSuffix(" NSArray!") {
        res = res.replacingOccurrences(of: " NSArray!", with: " NSArray = NSArray()")
    }
    if res.hasSuffix(" NSArray") {
        res = res.replacingOccurrences(of: " NSArray", with: " NSArray = NSArray()")
    }
    if res.range(of:": UnsafeMutablePointer<") != nil  && res.range(of:">!") != nil {
        res = res.replacingOccurrences(of: ": UnsafeMutablePointer<", with: " = ")
        res = res.replacingOccurrences(of: ">!", with: "()")
    }
    if res.range(of:": [") != nil  && res.hasSuffix("]!") {
        res = res.replacingOccurrences(of: ": [", with: " = [")
        res = res.replacingOccurrences(of: "]!", with: "]()")
    }
    if res.range(of:": [") != nil  && res.hasSuffix("]") {
        res = res.replacingOccurrences(of: ": [", with: " = [")
        res = res.replacingOccurrences(of: "]", with: "]()")
    }
    print("\(line) ---> \(res)")
    return res
}

func normalMLine(line:String) -> String {
    var res = line
    
    if res.hasPrefix("//") {
        res = ""
    }
    if res.hasPrefix("    private var ") {
        res = res.replacingOccurrences(of: ": String!", with: ": String! = \"\"")
        res = res.replacingOccurrences(of: ": NSArray!", with: ": NSArray! = NSArray()")
        
        if res.range(of: ": UnsafeMutablePointer<") != nil {
            res = res.replacingOccurrences(of: ": UnsafeMutablePointer<", with: " = ")
            res = res.replacingOccurrences(of: ">!", with: "()")
        }
        
    }
    
    res = res.replacingOccurrences(of: "JSONTransformerForKey(_ key: String!)", with: "jsonTransformer(forKey key: String!)")
    res = res.replacingOccurrences(of: "NSValueTransformer.mtl_JSONArrayTransformerWithModelClass(", with: "ValueTransformer.mtl_JSONArrayTransformer(withModelClass: ")
    res = res.replacingOccurrences(of: "NSValueTransformer.mtl_JSONDictionaryTransformerWithModelClass(", with: "ValueTransformer.mtl_JSONDictionaryTransformer(withModelClass: ")
    res = res.replacingOccurrences(of: "NSValueTransformer!", with: "ValueTransformer!")
    res = res.replacingOccurrences(of: "static func JSONKeyPathsByPropertyKey() -> NSDictionary!", with: "static func jsonKeyPathsByPropertyKey() -> [AnyHashable : Any]")
    res = res.replacingOccurrences(of: "static func JSONKeyPathsByPropertyKey() -> NSDictionary", with: "static func jsonKeyPathsByPropertyKey() -> [AnyHashable : Any]")
    res = res.replacingOccurrences(of: "static func FMDBPrimaryKeys() -> NSArray!", with: "static func fmdbPrimaryKeys() -> [Any]")
    res = res.replacingOccurrences(of: "static func jsonKeyPathsByPropertyKey()", with: "class func jsonKeyPathsByPropertyKey()")
    
    return res
}
