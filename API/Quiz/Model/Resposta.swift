//
//  Resposta.swift
//  API
//
//  Created by Giovanni Bruno on 01/11/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import UIKit

class Resposta {
    
    let texto: String
    let img: UIImage?
    let correta: Bool
    
    init(texto: String, img: UIImage?, correta: Bool) {
        self.texto = texto
        self.img = img
        self.correta = correta
    }
    
}
