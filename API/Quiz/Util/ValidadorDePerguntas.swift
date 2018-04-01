//
//  ValidadorDePerguntas.swift
//  API
//
//  Created by Guilherme Gatto on 15/11/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import Foundation

class ValidadorDePerguntas {
    
    /*
     * Valida resposta correta de acordo com a pergunta e resposta enviada.
     */
    static func validar(_ pergunta: Pergunta, _ resposta: Resposta) -> Bool {
        
        for res in pergunta.respostas {
            
            if resposta.texto == res.texto && res.correta {
                return true
            }
    
        }
        
        return false
    }
    
}
