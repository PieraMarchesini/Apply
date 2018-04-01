//
//  CorBE.swift
//  API
//
//  Created by Giovanni Bruno on 22/11/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import UIKit

struct CorBE: Codable {
    let id: Int64
    let red: Int
    let green: Int
    let blue: Int
    
    func toUIColor() -> UIColor {
        return UIColor(red: CGFloat(self.red)/CGFloat(255), green: CGFloat(self.green)/CGFloat(255), blue: CGFloat(self.blue)/CGFloat(255), alpha: 1)
    }

}

