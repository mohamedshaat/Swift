//
//  File.swift
//  SwiftStructure
//
//  Created by mohamed-shaat on 2/5/17.
//  Copyright © 2017 shaat. All rights reserved.
//

import Foundation

extension Dictionary {
    static func contentsOf(path: URL) -> Dictionary<String, AnyObject> {
        let data = try! Data(contentsOf: path)
        let plist = try! PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil)
        
        return plist as! [String: AnyObject]
    }
}
