//
//  C.swift
//  API
//
//  Created by Giovanni Bruno on 01/11/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import Foundation
import CoreGraphics

import UIKit

struct C {
    
    //SEGUES
    static let aprendaToLicoes = "aprendaToLicoes"
    static let licoesToPergunta = "licoesToPergunta"
    static let perguntasToFim = "perguntasToFim"
    
    //QUIZ
    static let categoriaCellIdentifier = "categoriaCell"
    static let tituloCellIdentifier = "tituloCell"
    static let licoesCell = "licoesCell"
    
    //CARD
    static let cornerRadius: CGFloat = 5
    static let shadowOffset: CGSize = CGSize(width: 0, height: 2)
    static let shadowColor: CGColor = UIColor.black.cgColor
    static let shadowOpacity: Float = 0.5
    static let fontSizeForAlternativaImgs: CGFloat = 17
    
    //Cores Paleta
    static let cinza  = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1)
    static let azul = UIColor(red: 62/255, green: 104/255, blue: 147/255, alpha: 1)
    static let laranja  = UIColor(red: 214/255, green: 127/255, blue: 47/255, alpha: 1)
    static let roxo = UIColor(red: 145/255, green: 101/255, blue: 228/255, alpha: 1)
    static let verde  = UIColor(red: 126/255, green: 161/255, blue: 79/255, alpha: 1)


    
    //Cores Grafico
    
    static let azulgrafico = UIColor(red: 65/255, green: 123/255, blue: 184/255, alpha: 1)
    static let verdegrafico  = UIColor(red: 136/255, green: 187/255, blue: 66/255, alpha: 1)

}

