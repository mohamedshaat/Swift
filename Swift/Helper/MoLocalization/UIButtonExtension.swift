//
//  UIButtonExtension.swift
//  SwiftStructure
//
//  Created by mohamed-shaat on 2/6/17.
//  Copyright © 2017 shaat. All rights reserved.
//

import Foundation
import Foundation
import UIKit
extension  UIButton
{
    @IBInspectable var localizationKey : String {
        set {
          
            
            setTitle(MoLocalization.getLocalizeString(key: newValue),for: .normal)
        }
        
        get {
            return (self.titleLabel?.text)!;
            
        }
    }
    @IBInspectable var borderColor: UIColor  {
        
        
        set {
            layer.borderColor = newValue.cgColor
        }
        
        get {
            return UIColor(cgColor:layer.borderColor!);
            
        }
        
    }
    
    
    @IBInspectable var cornurRadius: CGFloat {
        
        
        set {
            layer.cornerRadius = newValue
        }
        
        get {
            return layer.cornerRadius;
            
        }
        
    }

}
