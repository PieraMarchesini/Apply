//
//  LicaoPerguntaBE.swift
//  API
//
//  Created by Giovanni Bruno on 24/11/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import Foundation

struct LicaoBE: Codable { 
    let id: Int64
    let nome: String
    let descricaoCurta: String
    let cor: CorBE
    let perguntas: [PerguntaBE]
    let indice: Int
    
    func toLicao() -> LicaoPergunta {
        var perguntasUI = [Pergunta]()
        for p in self.perguntas {
            perguntasUI.append(p.toPergunta())
        }
        return LicaoPergunta(nome: nome, descricaoCurta: descricaoCurta, perguntas: perguntasUI, bgColor: cor.toUIColor(), indice: indice)
    }
}
