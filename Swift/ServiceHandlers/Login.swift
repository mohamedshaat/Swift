//
//  Login.swift
//  ProjectBasicStructure
//
//  Created by ProgmaIT on 4/13/16.
//  Copyright © 2016 ProgmaIT. All rights reserved.
//
//mahmoudbassam1971990@gmail.com
//123

import Foundation
import ObjectMapper
import Alamofire
class Login: NSObject {
    
    
  class  func loginNow(username:String,password:String,completionHandler: @escaping (LoginResponse?, NSError?) -> ()){

   var dictionary : Dictionary<String, String> = [:]
    
    dictionary["username"]=username;
    
    dictionary["password"]=password;
    
        NetWorkConnection.fetchData(url: Constants.WebService.URL_BASE+Constants.WebService.URL_LOGIN,token:"",httpmethod:HTTPMethod.post ,parameters: dictionary as NSDictionary,completionHandler: {responseObject, error in
            
            if(error==nil)
            {
                
               let loginResponse = Mapper<LoginResponse>().map(JSON:responseObject as! [String : Any]) //Swift 3
            
                completionHandler(loginResponse,nil)
                
            }
            else
            {
                completionHandler(nil,error);
            }
                

        });
        
        
       
        
    
    }
    

}
