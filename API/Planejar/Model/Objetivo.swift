//
//  Objetivo.swift
//  API
//
//  Created by Piera Marchesini on 05/12/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import UIKit

class Objetivo: NSObject {
    
    var nome: String
    var metaDinheiro: Double
    var metaData: Date
    var dataInicial: Date
    var investimentoInicial: Double
    var investimentoMensal: Double
    var tipo: TipoObjetivo
    
    
    init(nome: String, metaDinheiro: Double, dataInicial: Date, metaData: Date, investimentoInicial: Double, investimentoMensal: Double, tipo: TipoObjetivo){
        self.nome = nome
        self.metaDinheiro = metaDinheiro
        self.metaData = metaData
        self.investimentoInicial = investimentoInicial
        self.investimentoMensal = investimentoMensal
        self.tipo = tipo
        self.dataInicial = dataInicial
    }
    
}
