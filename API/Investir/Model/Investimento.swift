//
//  Investimento.swift
//  API
//
//  Created by Guilherme Gatto on 17/11/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import Foundation
import UIKit

class Investimento {
    
    let color: UIColor
    let title: String
    let subtitle: String
    
    init(title: String, subtitle: String, color: UIColor) {
        self.title = title
        self.subtitle = subtitle
        self.color = color  
    }
    
}
