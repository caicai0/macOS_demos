//
//  Utils.swift
//  convertOcModel
//
//  Created by liyufeng on 2019/9/20.
//  Copyright © 2019 liyufeng. All rights reserved.
//

import Foundation

func createScript() throws {
    var modelFiles:[String] = []
    var mfilesDic:[String:String] = [:]
    var hfilesDic:[String:String] = [:]
    var swiftFilesDic:[String:String] = [:]
    var convertScript:String = ""
    var deleteScript:String = ""
    var copyScript:String = ""
    var deleteSwiftScript:String = ""
    var moveBackScript:String = ""

    func converPathName(filePath:String) -> String {
        var path = filePath.replacingOccurrences(of: "(", with: "\\(")
        path = path.replacingOccurrences(of: ")", with: "\\)")
        path = path.replacingOccurrences(of: " ", with: "\\ ")
        return path
    }

    if let files = findAllFiles(dir: "/Users/liyufeng/git/gogs/JianKangJie") {
        //提取文件名
        for file in files {
            let fileUrl = URL(fileURLWithPath: file)
            let fileNames = fileUrl.lastPathComponent.split(separator: ".", maxSplits: 2, omittingEmptySubsequences:false)
            if fileNames.count == 2 {
                let name = String(fileNames[0])
                let ex = String(fileNames[1])
                if ex == "h" {
                    hfilesDic[name] = file
                }
                if ex == "m" {
                    mfilesDic[name] = file
                }
                if ex == "swift" {
                    swiftFilesDic[name] = file
                }
            }
        }
        
        let regex = try NSRegularExpression(pattern: "@interface[\\s]+([\\S]+)[\\s]+:[\\s]+MTLModel", options: .caseInsensitive)
        let regex1 = try NSRegularExpression(pattern: "@interface[\\s]+([\\S]+)[\\s]+:[\\s]+AlexBaseModel", options: .caseInsensitive)
        for file in files {
            if let contentData = FileManager.default.contents(atPath: file) {
                if let string = String(data: contentData, encoding: .utf8) {
                    var res = regex.matches(in: string, options: .reportCompletion, range: NSRange(location: 0, length: string.count))
                    if res.count > 0 {
                        modelFiles.append(file)
                    }
                    
                    res = regex1.matches(in: string, options: .reportCompletion, range: NSRange(location: 0, length: string.count))
                    if res.count > 0 {
                        modelFiles.append(file)
                    }
                }
            }
        }
        //补充.m文件
        for modelHFile in modelFiles {
            let fileUrl = URL(fileURLWithPath: modelHFile)
            let fileNames = fileUrl.lastPathComponent.split(separator: ".", maxSplits: 2, omittingEmptySubsequences:false)
            if fileNames.count == 2 {
                let name = String(fileNames[0])
                if let mfile = mfilesDic[name] {
                    let convertCmd = "./SwiftRewriter files " + converPathName(filePath: modelHFile) + " " + converPathName(filePath: mfile) + "\n"
                    convertScript = convertScript + convertCmd
                    let deleteCmd = "rm " + converPathName(filePath: modelHFile) + " " + converPathName(filePath: mfile) + "\n"
                    deleteScript = deleteScript + deleteCmd
                }
                if let swiftFile = swiftFilesDic[name] {
                    let url = URL(fileURLWithPath: swiftFile)
                    let swiftFileName = url.lastPathComponent
                    let outFile = "/Users/liyufeng/Desktop/model/swift/" + swiftFileName

                    let moveCmd = "cp " + converPathName(filePath: swiftFile) + " \(outFile)\n"
                    copyScript = copyScript + moveCmd
                    
                    let movebackCmd = "cp " + outFile + " " + converPathName(filePath: swiftFile) + "\n"
                    moveBackScript = moveBackScript + movebackCmd
                    
                    let deleteCmd = "rm " + converPathName(filePath: swiftFile) + "\n"
                    deleteSwiftScript = deleteSwiftScript + deleteCmd
                }
            }
        }
    }

    do {
        let scriptPath = "/Users/liyufeng/Desktop/model/script"
        try convertScript.write(toFile: scriptPath + "/convertScript.sh", atomically: true, encoding: .utf8)
        try deleteScript.write(toFile: scriptPath + "/deleteScript.sh", atomically: true, encoding: .utf8)
        try copyScript.write(toFile: scriptPath + "/copyScript.sh", atomically: true, encoding: .utf8)
        try deleteSwiftScript.write(toFile: scriptPath + "/deleteSwiftScript.sh", atomically: true, encoding: .utf8)
        try moveBackScript.write(toFile: scriptPath + "/moveBackScript.sh", atomically: true, encoding: .utf8)
    }catch{
        print(error)
    }
}

func findAllFiles(dir : String) -> [String]? {
    var files : [String] = []
    var isDir : ObjCBool = ObjCBool(false)
    if FileManager.default.fileExists(atPath: dir, isDirectory: &isDir) && isDir.boolValue {
        if let subpaths = FileManager.default.subpaths(atPath: dir) {
            for item in subpaths {
                let fullPath = dir+"/"+item
                FileManager.default.fileExists(atPath: fullPath, isDirectory: &isDir)
                if !isDir.boolValue {
                    if fullPath.hasSuffix(".h") || fullPath.hasSuffix(".m") || fullPath.hasSuffix(".swift") {
                        files.append(fullPath)
                    }
                }
            }
        }
    }
    return files
}
