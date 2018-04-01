//
//  Opniao.swift
//  API
//
//  Created by Guilherme Gatto on 21/11/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import Foundation
import UIKit

class Opiniao {
    
    let photo : UIImage
    let name: String
    let opinion: String
    
    init(name: String, opinion: String, photo: UIImage) {
        self.name = name
        self.opinion = opinion
        self.photo = photo
    }
    
    
}
