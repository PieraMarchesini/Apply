//
//  Corretora.swift
//  API
//
//  Created by Guilherme Gatto on 17/11/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import Foundation
import UIKit

enum TipoCorretora: Int {
    case parceira = 0, normal
}


class Corretora {
    
    let image: UIImage?
    let color: UIColor
    let tipoCorretora: TipoCorretora
    let name: String
    let description: String?
    let phone: String?
    let email: String?
    
    init(name: String, color: UIColor, tipo: TipoCorretora) {
        
        self.name = name
        self.color = color
        self.tipoCorretora = tipo
        
        image = nil
        description = ""
        phone = ""
        email = ""
    }
    
    init(name: String, description: String, phone: String, email: String, image: UIImage?, color: UIColor, tipo: TipoCorretora) {
        
        self.name = name
        self.color = color
        self.tipoCorretora = tipo
        self.image = image
        self.description = description
        self.phone = phone
        self.email = email
    }
    
    
}
