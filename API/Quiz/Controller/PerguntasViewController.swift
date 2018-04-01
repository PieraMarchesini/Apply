//
//  PerguntasViewController.swift
//  API
//
//  Created by Giovanni Bruno on 09/11/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import UIKit

class PerguntasViewController: UIViewController {
    
    @IBOutlet weak var barraDeBaixo: UIView!
    @IBOutlet weak var barraDeCima: UIView!
    
    @IBOutlet weak var verificarBtn: UIButton!
    
    var licao: Licao!
    
    var cards = [CardView]()
    
    var totalDePerguntas: Int = 0
    
    var acertos: Int = 0
    
    var verificar = true
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let licao = licao as? LicaoPergunta else {return}
        
        licao.perguntas.sort { (p1, p2) -> Bool in
            return p1.indice > p2.indice
        }
        
        for (i,p) in licao.perguntas.enumerated() {
            var pos: PositionCard
            var hasShadow = true
            
            if i == 0 {
                pos = .p1
            }else if i == 1{
                pos = .p2
            }else{
                pos = .p3
                hasShadow = false
            }
            
            if i == licao.perguntas.count-1 {
                hasShadow = true
            }
            
            let card = CardFactory.shared.addCard(pergunta: p, view: view!, position: pos, hasShadow: hasShadow)
            card?.delegate = self
            guard let c = card else {continue}
            
            c.bgColor = licao.bgColor
            
            cards.append(c)
            
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let licao = licao as? LicaoPergunta {
            totalDePerguntas = licao.perguntas.count
        }
        
        acertos = 0
        
        view.backgroundColor = licao.bgColor
        
        barraDeCima.layer.cornerRadius = C.cornerRadius
        barraDeBaixo.layer.cornerRadius = C.cornerRadius
        
        barraDeCima.backgroundColor = UIColor(red: 204/255, green: 201/255, blue: 201/255, alpha: 1)
        barraDeCima.frame.size.width = 0
        
        verificarBtn.isEnabled = false
        
        verificarBtn.layer.cornerRadius = C.cornerRadius
        verificarBtn.tintColor = licao.bgColor
        
        Util.addShadow(to: verificarBtn)
    }
    
    @IBAction func fechar(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func verificar(_ sender: UIButton) {
        guard let card = cards.last else {return}
        
        if verificar {
            verificar = false
            //Alterar o botao para continuar
            verificarBtn.setTitle("Continuar", for: .normal)
            verificarBtn.setTitle("Continuar", for: .disabled)
            
            //Impede que usuario selecione outra alternativa
            card.gameOver = true
            
            //Mostrar o feedback do batman
            card.showFeedback()
            
            UIView.animate(withDuration: 0.75, animations: {
                if let licao = self.licao as? LicaoPergunta {
                    self.barraDeCima.frame.size.width += self.barraDeBaixo.frame.width/CGFloat(licao.perguntas.count)
                }
            })
            
            //Verifica se esta certo
            guard let alt = card.alternativaSelecionada, let pergunta = card.perguntaObj else {return}
            let acertou = pergunta.eCerta(alternativa: alt)
            if acertou {
                acertos += 1
            }else{
                card.shake()
            }
        }else{
            verificar = true
            verificarBtn.setTitle("Verificar", for: .normal)
            verificarBtn.setTitle("Verificar", for: .disabled)
            
            //Jogar a carta fora com animação
            UIView.animate(withDuration: 0.75, animations: {
                let newYPos = -(self.view.frame.midY + self.view.frame.size.height)
                let newXPos = self.view.frame.midX + self.view.frame.size.width * CGFloat(Int.sign())
                if self.cards.count > 1 {
                    card.mView.center = CGPoint(x: newXPos, y: newYPos)
                }
                
            }, completion: { (_) in
                if self.cards.count < 1 {
                    self.performSegue(withIdentifier: C.perguntasToFim, sender: self)
                }
                card.removeFromSuperview()
                
            })
            
            self.cards.removeLast()
            card.alternativaSelecionada = nil
            
            //Adiciona shadow ao novo card que está na frente
            guard let newCard = self.cards.last else {return}
            newCard.addShadow()
            newCard.alternativaSelecionada = nil
            //Adicionar pontos totais
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? FimDaLicaoViewController {
            if segue.identifier == C.perguntasToFim {
                destination.licao = licao
                destination.aproveitamento = (n1: acertos, n2: totalDePerguntas)
            }
        }
    }
}

extension PerguntasViewController: CardDelegate {
    func didSelectAlternativa() {
        verificarBtn.isEnabled = true
    }
    
    func didUnselectAlternativa() {
        verificarBtn.isEnabled = false
    }

}
