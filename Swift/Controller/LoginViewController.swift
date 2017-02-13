//
//  LoginViewController.swift
//  SwiftStructure
//
//  Created by mohamed-shaat on 2/8/17.
//  Copyright © 2017 shaat. All rights reserved.
//

import UIKit
import EZLoadingActivity
class LoginViewController: AbstractViewController {
    @IBOutlet weak var textField_userName: UITextField!

    @IBOutlet weak var scrollViewForLogin: UIScrollView!
    
    @IBOutlet weak var textField_password: UITextField!
    @IBOutlet weak var textField_fullName: UITextField!
    override func viewDidLoad() {
      
        super.viewDidLoad()
      setDelegateForTextFiels()
        self.scrollView=scrollViewForLogin;
        hideKeyboard();
        
        
    }

    override func viewDidAppear(_ animated: Bool) {
        EZLoadingActivity.show("Loading...", disableUI: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            EZLoadingActivity.hide(true, animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    func setDelegateForTextFiels()
    {
        textField_userName.delegate=self;
        textField_password.delegate=self;
        textField_fullName.delegate=self;
    }
    
    
    @IBAction func doLogin(_ sender: Any) {
        
            EZLoadingActivity.show("Loading...", disableUI: true)
        Login.loginNow(username:textField_fullName.text!, password:textField_password.text!,completionHandler:{responseObject, error in
             EZLoadingActivity.hide(true, animated: true)            
            
            
        });
        
    }
    
    

}
