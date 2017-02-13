//
//  ViewRecursion.swift
//  Swift_iOS-Localize-Constraint
//  Created by mohamed-shaat on 2/5/17.
//  Copyright © 2017 shaat. All rights reserved.
//

import Foundation
import UIKit
extension UIView {
    
    func checkDirectionForallSubViews()
    
    {
       
          changeViewRTL(tempView: self);
        for  subView: UIView in self.subviews
        {
            checkViewAlignmentAndText(tempView: subView);
            changeViewRTL(tempView: subView);
            subView.checkDirectionForallSubViews();
        }
        
     
    }
    
    
    func checkViewAlignmentAndText(tempView:UIView)
    {
        if  tempView is UITextField
        {
            
            let textField:UITextField=tempView as! UITextField
            if (textField.textAlignment != NSTextAlignment.center)
            {
                textField.textAlignment = .right;
            }
            
        }
        else
            if tempView is UITextView
            {
                let textView:UITextView=tempView as! UITextView
                if (textView.textAlignment != NSTextAlignment.center)
                {
                    textView.textAlignment = .right;
                }
            }
            else
                if tempView is UILabel
                {
                    let label:UILabel=tempView as! UILabel
                    if (label.textAlignment != NSTextAlignment.center)
                    {
                        label.textAlignment = .right;
                        
                    }
        }
        
    }
    func changeViewRTL(tempView:UIView){
        
        var constraintsToAdd: [NSLayoutConstraint] = [NSLayoutConstraint]()
        var constraintsToRemove: [NSLayoutConstraint] = [NSLayoutConstraint]()
        
        for  constraint: NSLayoutConstraint  in tempView.constraints  {
            
            
            var  firstAttribute:NSLayoutAttribute = constraint.firstAttribute
            var secondAttribute:NSLayoutAttribute = constraint.secondAttribute
            
            if (self.IsValideAttribute(attribute: firstAttribute) && self.IsValideAttribute(attribute: secondAttribute)) {
                
                firstAttribute = self.changeAttributeValue(attribute: firstAttribute);
                secondAttribute = self.changeAttributeValue(attribute: secondAttribute);
                
                constraint.constant *= -1;
                
                
                let constraintNew:NSLayoutConstraint = NSLayoutConstraint(item: constraint.firstItem, attribute: firstAttribute, relatedBy: constraint.relation , toItem: constraint.secondItem , attribute:secondAttribute, multiplier: constraint.multiplier, constant: constraint.constant);
                
                constraintsToRemove.append(constraint)
                constraintsToAdd.append(constraintNew)
                
            }
            
        }
        
        for  constraint: NSLayoutConstraint in constraintsToRemove {
            tempView.removeConstraint(constraint)
        }
        for  constraint: NSLayoutConstraint in constraintsToAdd {
            tempView.addConstraint(constraint)
        }
    }
    
    func IsValideAttribute(attribute :NSLayoutAttribute)->Bool{
        
        if  attribute == NSLayoutAttribute.leading || attribute == NSLayoutAttribute.trailing || attribute == NSLayoutAttribute.left || attribute == NSLayoutAttribute.right ||
            attribute == NSLayoutAttribute.leadingMargin || attribute == NSLayoutAttribute.trailingMargin || attribute == NSLayoutAttribute.leftMargin || attribute == NSLayoutAttribute.rightMargin {
            return true
        }else{
            return false
        }
    }
    
    func checkLanguage()
    {
        if MoLocalization.getCurrentLanguage()==Constants.Language.ARABIC
        {
            checkDirectionForallSubViews();
            
        }
        
    }
    
    func checkLangAppleWay()
    {
        if MoLocalization.getCurrentLanguage()==Constants.Language.ARABIC
        {
           UIView.appearance().semanticContentAttribute = .forceRightToLeft
            
        }
    }
    func changeAttributeValue( attribute:NSLayoutAttribute) -> NSLayoutAttribute{
        var attribute = attribute
        switch (attribute) {
        case NSLayoutAttribute.leading:
            attribute = NSLayoutAttribute.trailing;
            break;
        case NSLayoutAttribute.leadingMargin:
            attribute = NSLayoutAttribute.trailingMargin;
            break;
        case NSLayoutAttribute.trailing:
            attribute = NSLayoutAttribute.leading;
            break;
        case NSLayoutAttribute.trailingMargin:
            attribute = NSLayoutAttribute.leadingMargin;
            break;
        case NSLayoutAttribute.left:
            attribute = NSLayoutAttribute.right;
            break;
        case NSLayoutAttribute.leftMargin:
            attribute = NSLayoutAttribute.rightMargin;
            break;
        case NSLayoutAttribute.right:
            attribute = NSLayoutAttribute.left;
            break;
        case NSLayoutAttribute.rightMargin:
            attribute = NSLayoutAttribute.leftMargin;
            break;
        default:
            break;
        }
        return attribute;
    }

}
