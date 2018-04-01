//
//  ABCDCardView.swift
//  API
//
//  Created by Giovanni Bruno on 14/11/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import Foundation
import UIKit


class ABCDCardView: CardView {
    
    @IBOutlet var view: UIView!
    @IBOutlet weak var pergunta: UILabel!
    
    @IBOutlet weak var alternativaA: UILabel!
    @IBOutlet weak var alternativaB: UILabel!
    @IBOutlet weak var alternativaC: UILabel!
    @IBOutlet weak var alternativaD: UILabel!
    
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!
    
    @IBOutlet weak var A: UILabel!
    @IBOutlet weak var B: UILabel!
    @IBOutlet weak var C: UILabel!
    @IBOutlet weak var D: UILabel!
    
    override var mView: UIView! {
        get {
            return view
        }set{
            self.mView = newValue
        }
    }
    
    override var perguntaObj : Pergunta?{
        didSet {
            guard let perguntaObj = perguntaObj else {return}
            perguntaObj.embaralha()
            pergunta.text = perguntaObj.pergunta
            alternativaA.text = perguntaObj.respostas[0].texto
            alternativaB.text = perguntaObj.respostas[1].texto
            alternativaC.text = perguntaObj.respostas[2].texto
            alternativaD.text = perguntaObj.respostas[3].texto
        }
    }
    
    override var bgColor: UIColor? {
        didSet{
            guard let bgColor = bgColor else {return}
            setLetrasColor(to: bgColor)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup(){
        Bundle.main.loadNibNamed("ABCDCardView", owner: self, options: nil)
        addSubview(view)
        
        view.frame = self.bounds
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = false
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        buttonA.layer.cornerRadius = 5
        buttonB.layer.cornerRadius = 5
        buttonC.layer.cornerRadius = 5
        buttonD.layer.cornerRadius = 5

      
    }
    
    func selectAlt(btn: UIButton){
        buttonA.alpha = 1
        buttonB.alpha = 1
        buttonC.alpha = 1
        buttonD.alpha = 1
        
        buttonA.backgroundColor = .clear
        buttonB.backgroundColor = .clear
        buttonC.backgroundColor = .clear
        buttonD.backgroundColor = .clear
        
        btn.alpha = 0.10
        btn.backgroundColor = .black
    }
    
    @IBAction func opcaoA(_ sender: Any) {
        alternativaSelecionada = alternativaA.text
        selectAlt(btn: buttonA)
    }
    
    @IBAction func opcaoB(_ sender: Any) {
        alternativaSelecionada = alternativaB.text
        selectAlt(btn: buttonB)

    }
    
    @IBAction func opcaoC(_ sender: Any) {
       alternativaSelecionada = alternativaC.text
        selectAlt(btn: buttonC)

    }
    
    @IBAction func opcaoD(_ sender: Any) {
        alternativaSelecionada = alternativaD.text
        selectAlt(btn: buttonD)
    }

    override func showFeedback(){
        guard let pergunta = perguntaObj, let alt = alternativaSelecionada else {return}
        let certa = pergunta.certa()
        let btn = btnFor(alternativa: certa)
        btn.backgroundColor = .green
        btn.alpha = 0.2
        
        if certa != alt {
            let btn = btnFor(alternativa: alt)
            btn.backgroundColor = .red
            btn.alpha = 0.2
        }

    }
    
    private func btnFor(alternativa: String) -> UIButton{
        switch alternativa {
        case alternativaA.text ?? "":
            return buttonA
        case alternativaB.text ?? "":
            return buttonB
        case alternativaC.text ?? "":
            return buttonC
        case alternativaD.text ?? "":
            return buttonD
        default:
            return buttonD
        }
    }
    
    func setLetrasColor(to: UIColor) {
        A.textColor = to
        B.textColor = to
        C.textColor = to
        D.textColor = to
    }
}
