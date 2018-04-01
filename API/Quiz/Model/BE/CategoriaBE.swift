
//
//  CategoriaBE.swift
//  API
//
//  Created by Giovanni Bruno on 24/11/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import Foundation

struct CategoriaBE: Codable {
    let id: Int64
    let nome: String
    let imgCollection: String
    let imgNav: String
    let descricaoCurta: String
    let licoes: [LicaoBE]
    let dicaDoDia: Bool
    let indice: Int
    
    func toCategoria() -> Categoria {
        var licoesUI = [Licao]()
        for l in self.licoes {
            licoesUI.append(l.toLicao())
        }
        return Categoria.init(nome: nome, imagemCollection: Util.image(base64: imgCollection), imagemNavigation: Util.image(base64: imgNav), descricaoCurta: descricaoCurta, licoes: licoesUI, dicaDoDia: dicaDoDia, indice: indice)
    }
}
