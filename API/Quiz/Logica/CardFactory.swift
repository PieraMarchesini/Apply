//
//  Card.swift
//  API
//
//  Created by Giovanni Bruno on 14/11/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import UIKit

enum PositionCard: Int {
    case p1 = 1, p2, p3
}

class CardFactory {
    
    static let shared = CardFactory()
    
    private init(){}
    
    //ADICIONA CARD NA TELA
    func addCard(pergunta: Pergunta, view: UIView, position: PositionCard, hasShadow: Bool) -> CardView? {
        var c: CardView?
        //Instancia o tipo certo de card, dependendo do tipo da pergunta
        if pergunta.tipoPergunta == .abcd {
            c = ABCDCardView()
        }else if pergunta.tipoPergunta == .imagens {
            c = ImageCardView()
        }
        
        //Preenche card com dados da pergunta
        c?.perguntaObj = pergunta
        c?.position = position
        
        //Setup das constraints
        guard let card = c else {return nil}
        setupConstraints(to: card, hasShadow: hasShadow, view: view, position: position)
        
        //Adiciona shadow se necessário
        if hasShadow {
            c?.addShadow()
        }
        
        return c
    }
    
    
    private func setupConstraints(to c: UIView, hasShadow: Bool, view: UIView, position: PositionCard){
        view.addSubview(c)
        
        
//        c.clipsToBounds = true
        c.translatesAutoresizingMaskIntoConstraints = false
       
        c.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        let p = position.rawValue
        var yConstraint: NSLayoutConstraint
        if p > 3 {
            yConstraint = c.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -CGFloat(3)*view.frame.height/100)
        }else{
            yConstraint = c.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -CGFloat(p)*view.frame.height/100)
        }
        yConstraint.isActive = true
        c.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        c.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        var scaleY: CGFloat = 1
        switch p {
        case 1:
            scaleY = 0.92
            break
        case 2:
            scaleY = 0.96
            break
        default:
            scaleY = 1.0
            break
        }
        
        c.transform = CGAffineTransform(scaleX: scaleY, y: 1)

    }
    
    //RESPOSAVEL POR LIDAR COM TOQUES NO CARD
    //SABER QUAL É A RESPOSTA CERTA
}
