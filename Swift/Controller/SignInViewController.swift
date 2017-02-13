//
//  SignInViewController.swift
//  Swift
//
//  Created by mohamed-shaat on 2/5/17.
//  Copyright © 2017 shaat. All rights reserved.
//

import UIKit
import EZLoadingActivity
class SignInViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let value=MoLocalization.getLocalizeString(key: "signin_title")
        
        NSLog("%@", value);
       self.view.checkLanguage()
     
        // Do any additional setup after loading the view.
    }

  
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func setLang(_ sender: Any) {
        
        MoLocalization .setCurrentLang(lang: Constants.Language.ARABIC);
        
    }
    @IBAction func goMenu(_ sender: Any) {
        
         
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
