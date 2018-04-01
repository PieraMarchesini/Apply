//
//  Pergunta.swift
//  API
//
//  Created by Giovanni Bruno on 31/10/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import UIKit

enum TipoPergunta: Int, Codable {
    case abcd = 0, imagens, dragDrop
    
    static func from(string: String) -> TipoPergunta {
        switch string {
        case "ABCD":
            return TipoPergunta.abcd
        case "IMAGENS":
            return TipoPergunta.imagens
        case "DRAGDROP":
            return TipoPergunta.dragDrop
        default:
             return TipoPergunta.abcd
        }
    }
}

class Pergunta {
    let pergunta: String
    let imgExplicacaoFinal: UIImage?
    let explicacaoFinal: String
    let explicacaoCurta: String
    var respostas: [Resposta]
    let tipoPergunta: TipoPergunta
    let indice: Int
    
    init(pergunta: String, explicacaoFinal: String, explicacaoCurta: String, imgExplicacaoFinal: UIImage?, respostas: [Resposta], tipoPergunta: TipoPergunta, indice: Int) {
        self.pergunta = pergunta
        self.explicacaoFinal = explicacaoFinal
        self.explicacaoCurta = explicacaoCurta
        self.imgExplicacaoFinal = imgExplicacaoFinal
        assert(respostas.count == 4)
        self.respostas = respostas
        self.tipoPergunta = tipoPergunta
        self.indice = indice
    }
    
    func embaralha() {
        //Embaralha
        for _ in 1...30 {
            let n1 = Int.random(min: 0, max: respostas.count-1)
            let n2 = Int.random(min: 0, max: respostas.count-1)
            let r = respostas[n1]
            respostas[n1] = respostas[n2]
            respostas[n2] = r
        }
    }
    
    func eCerta(alternativa: String) -> Bool {
        for r in respostas {
            if r.texto == alternativa && r.correta {
                return true
            }
        }
        return false
    }
    
    func certa() -> String {
        for r in respostas {
            if r.correta {
                return r.texto
            }
        }
        return ""
    }
    
}
