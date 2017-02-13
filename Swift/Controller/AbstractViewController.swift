//
//  AbstractViewController.swift
//  SwiftStructure
//
//  Created by mohamed-shaat on 2/8/17.
//  Copyright © 2017 shaat. All rights reserved.
//

import UIKit

class AbstractViewController: UIViewController,UIGestureRecognizerDelegate,UITextFieldDelegate,UITextViewDelegate {

       var activeField: UIView!
    var scrollView:UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addObserverForKeyBoard();
       
     
       
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
    
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
   
    // MARK: - KeyBoardNotification
    
    
    func keyboardWillAppear(notification: NSNotification){
        let userInfo: NSDictionary = notification.userInfo! as NSDictionary
        let keyboardSize = (userInfo.object(forKey: UIKeyboardFrameBeginUserInfoKey)! as AnyObject).cgRectValue.size
        let contentInsets = UIEdgeInsetsMake(0, 0, keyboardSize.height, 0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
        
        var viewRect = view.frame
        viewRect.size.height -= keyboardSize.height
        if viewRect.contains(activeField.frame.origin) {
            let scrollPoint = CGPoint(x:0,y: activeField.frame.origin.y - keyboardSize.height)
            scrollView.setContentOffset(scrollPoint, animated: true)
        }
        
    }
    
    func keyboardWillDisappear(notification: NSNotification){
        // Do something here
        let contentInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        self.scrollView.contentInset = contentInsets;
        self.scrollView.scrollIndicatorInsets = contentInsets;
    }
    
    func addObserverForKeyBoard()
    {
    
        NotificationCenter.default.addObserver(self,
        selector: #selector(keyboardWillAppear(notification:)),
        name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self,
        selector: #selector(keyboardWillDisappear(notification:)),
        name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
    }
    
   // MARK: - Text Field Delegate Functions
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        activeField=textField;
       
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        activeField=nil;
        
    }
    
     // MARK: - Text View Delegate Functions
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        activeField=textView;
        
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        activeField=nil;
    }
    

}
