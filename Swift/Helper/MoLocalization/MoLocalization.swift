//
//  MoLocalization.swift
//  SwiftStructure
//
//  Created by mohamed-shaat on 2/5/17.
//  Copyright © 2017 shaat. All rights reserved.
//

import UIKit

class MoLocalization: NSObject {
    
   static var localizationKeysAndValues:NSDictionary?
  class  func loadLocalizeFile(fileName:String)
    {
        let path = Bundle.main.path(forResource: fileName, ofType: "plist")!
        let url = URL(fileURLWithPath: path)
        MoLocalization.localizationKeysAndValues = Dictionary<String, AnyObject>.contentsOf(path: url) as NSDictionary
    }
    
    class func  getLocalizeString(key:String)->String {
        
     
      let a = localizationKeysAndValues?[ MoLocalization.getCurrentLanguage()+"_"+key]! as! String
        
        return a;

    }
    
  class func getCurrentLanguage()->String
  {
   return NSLocale.preferredLanguages[0] as String
    
  }
   
    class func setCurrentLang(lang:String)
    {
        let userdef = UserDefaults.standard
        userdef.set([lang], forKey:"AppleLanguages")
        userdef.synchronize()
    }
    

}
