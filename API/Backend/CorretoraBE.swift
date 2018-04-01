//
//  Corretora.swift
//  API
//
//  Created by Giovanni Bruno on 22/11/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import UIKit
import Foundation

struct CorretoraBE: Codable {
    let id: Int64
    let nome: String
    let descricao: String
    let cor: CorBE
    
    let taxaRendaFixa: Double
    let taxaRendaVariavel: Double
    let sobre: String
    let endereco: String
    let email: String
    let telefone: String
    let taxaZero: Bool
    let aplicativo: Bool
    let homeBroker: Bool
    let eParceira: Bool
    let webSite: String
    
    let opinioes: [OpiniaoBE]?
    
    let fotoSobre: String?

//    func toCorretora() -> Corretora {
//        let c = Corretora(name: self.nome, description: self.descricao, phone: self.telefone, email: self.email, image: nil, color: self.cor.toUIColor(), tipo: TipoCorretora.parceira)
//        return c
//    }
    
}
