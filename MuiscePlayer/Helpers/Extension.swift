//
//  Extension.swift
//  MuiscePlayer
//
//  Created by Mostafa on 11/23/18.
//  Copyright © 2018 Mostafa. All rights reserved.
//

import UIKit

extension UIView{
    
    // corner radius
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    
    // border width
    @IBInspectable var borderWidth: CGFloat {
        get {
            return self.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    
    // border width
    @IBInspectable var borderColor: UIColor{
        get {
            return self.borderColor
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
    
    
    // shadow
    @IBInspectable var shadowColor: UIColor{
        get {
            return self.shadowColor
        }
        set {
            self.layer.shadowColor = newValue.cgColor
            self.layer.shadowOffset = CGSize.zero
            self.layer.shadowOpacity = 1
            self.layer.shadowRadius = 4
            self.layer.masksToBounds = false
        }
    }
    
    
    // add shadow to view
    @objc func addShadow(color: UIColor){
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 4
        self.layer.masksToBounds = false
    }
    
    
}
extension UIViewController{
    func getFormattedTime(count: Double) -> String{
        let duration = Int(count)
        let durationMinutes = duration/60
        let durationSec = duration - durationMinutes * 60
        return (NSString(format: "%02d:%02d", durationMinutes,durationSec) as String)
    }
}
