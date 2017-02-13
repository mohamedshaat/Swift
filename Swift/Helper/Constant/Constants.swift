//
//  File.swift
//  SwiftStructure
//
//  Created by mohamed-shaat on 2/6/17.
//  Copyright © 2017 shaat. All rights reserved.
//

import Foundation

struct Constants {
    struct Language {
        static let ARABIC="ar"
        static let ENGLISH="en"
    }
    
    struct WebService {
        
        static let URL_BASE="http://tfs.ibtikar.sa:4444/api"
         static let URL_LOGIN="/login"
        
    }
    struct  KeysAndValuesForWebServiceHeader {
    
        static let KEY_ApiName="X-Api-Key"
        static let KEY_ApiValue="123"
        static let KEY_LANG="lang"
        static let KEY_CONTENT_TYPE="Content-Type"
        static let KEY_CONTENT_VALUE="Application/json"
        static let KEY_Authorization="Authorization"
    }
}
