//
//  CardView.swift
//  API
//
//  Created by Giovanni Bruno on 21/11/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import UIKit

class CardView: UIView {
    
    var mView : UIView!
    
    var perguntaObj: Pergunta?
    
    var position: PositionCard!
    
    var delegate: CardDelegate?
    
    var bgColor: UIColor?
    
    var gameOver = false
    
    var alternativaSelecionada: String? {
        didSet{
            guard let delegate = delegate else {return}
            if let _ = alternativaSelecionada {
                delegate.didSelectAlternativa()
            }else{
                delegate.didUnselectAlternativa()
            }
        }
    }
    
    func showFeedback(){
        fatalError("STUB")
    }
    
    func addShadow(){
        Util.addShadow(to: self)
    }
    
    
}
