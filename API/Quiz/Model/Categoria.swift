//
//  Categoria.swift
//  API
//
//  Created by Giovanni Bruno on 07/11/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import UIKit

class Categoria {
    
    let nome: String
    let imagemCollection: UIImage
    let imagemNavigation: UIImage
    let descricaoCurta: String
    var licoes: [Licao]
    let dicaDoDia: Bool
    let indice: Int
    
    init(nome: String, imagemCollection: UIImage, imagemNavigation: UIImage, descricaoCurta: String
        ,licoes: [Licao], dicaDoDia: Bool, indice: Int
        ) {
//        assert(licoes.count >= 1)
        self.licoes = licoes
        self.nome = nome
        self.imagemCollection = imagemCollection
        self.imagemNavigation = imagemNavigation
        self.descricaoCurta = descricaoCurta
        self.dicaDoDia = dicaDoDia
        self.indice = indice
    }
    
}
