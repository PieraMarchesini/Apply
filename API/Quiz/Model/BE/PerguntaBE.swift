//
//  Pergunta.swift
//  API
//
//  Created by Giovanni Bruno on 24/11/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import Foundation

struct PerguntaBE: Codable {
    let id: Int64
    let pergunta: String
    let explicacaoFinal: String?
    let explicacaoCurta: String?
    let tipoPergunta: String
    let respostas: [RespostaBE]
    let indice: Int
    
    func toPergunta() -> Pergunta {
        var respostasUI = [Resposta]()
        for r in respostas {
            respostasUI.append(r.toResposta())
        }
        return Pergunta.init(pergunta: pergunta, explicacaoFinal: explicacaoCurta ?? "", explicacaoCurta: explicacaoFinal ?? "", imgExplicacaoFinal: nil, respostas: respostasUI, tipoPergunta: TipoPergunta.from(string: tipoPergunta), indice: indice)
    }
}
