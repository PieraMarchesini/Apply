//
//  Licao.swift
//  API
//
//  Created by Giovanni Bruno on 07/11/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import UIKit

class Licao {
    
    let nome: String
    let descricaoCurta: String
    let bgColor: UIColor
    let indice: Int
    
    init(nome: String, descricaoCurta: String, bgColor: UIColor, indice: Int) {
        self.nome = nome
        self.descricaoCurta = descricaoCurta
        self.bgColor = bgColor
        self.indice = indice
    }
    
}

class LicaoPergunta: Licao {
    
    var perguntas: [Pergunta]
    
    init(nome: String, descricaoCurta: String ,perguntas: [Pergunta], bgColor: UIColor, indice: Int) {
        //assert(perguntas.count >= 1)
        self.perguntas = perguntas
        super.init(nome: nome, descricaoCurta: descricaoCurta, bgColor: bgColor, indice: indice)
    }
    
}

class LicaoDica: Licao {
    
    let data: Date
    
    init(nome: String, imagemDeFundo: UIImage, descricaoCurta: String, data: Date, bgColor: UIColor, indice: Int) {
        self.data = data
        super.init(nome: nome, descricaoCurta: descricaoCurta, bgColor: bgColor, indice: indice)
    }
    
}
