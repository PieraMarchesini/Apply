//
//  UIView+Extensions.swift
//  API
//
//  Created by Giovanni Bruno on 21/11/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import UIKit

extension UIView {
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = 0.3
        animation.values = [-15.0, 15.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
    
    func jump() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.y")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        animation.duration = 0.3
        animation.values = [-50, 0.0]
        layer.add(animation, forKey: "jump")
    }
    
    func shadowWithBlur() {
        let shadowSize : CGFloat = 5.0
        let shadowPath = UIBezierPath(roundedRect: CGRect(x: -shadowSize,
                                                          y: -shadowSize,
                                                          width: self.frame.size.width + shadowSize,
                                                          height: self.frame.size.height + shadowSize), cornerRadius: 10)
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor(red: 134/255, green: 133/255, blue: 133/255, alpha: 50).cgColor
        self.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        self.layer.shadowOpacity = 0.14
        self.layer.shadowPath = shadowPath.cgPath
    }
    
    func shadow() {
        let shadowSize : CGFloat = 4.0
        let shadowPath = UIBezierPath(roundedRect: CGRect(x: -shadowSize/3,
                                                          y: -shadowSize/3,
                                                          width: self.frame.size.width + shadowSize,
                                                          height: self.frame.size.height + shadowSize), cornerRadius: 5)
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor(red: 134/255, green: 133/255, blue: 133/255, alpha: 50).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowPath = shadowPath.cgPath
    }
}
