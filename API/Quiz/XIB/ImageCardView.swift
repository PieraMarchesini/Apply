//
//  ImageCardView.swift
//  API
//
//  Created by Giovanni Bruno on 21/11/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import UIKit

class ImageCardView: CardView {
    
    @IBOutlet weak var pLabel: UILabel!
    
    @IBOutlet var view: UIView!
    
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    
    override var mView: UIView! {
        get {
            return view
        }set{
            self.mView = newValue
        }
    }
    
    override var perguntaObj : Pergunta?{
        didSet {
            guard let pergunta = perguntaObj else {return}
            pergunta.embaralha()
            pLabel.text = pergunta.pergunta
            label1.text = pergunta.respostas[0].texto
            label2.text = pergunta.respostas[1].texto
            label3.text = pergunta.respostas[2].texto
            label4.text = pergunta.respostas[3].texto
            
            img1.image = pergunta.respostas[0].img
            img2.image = pergunta.respostas[1].img
            img3.image = pergunta.respostas[2].img
            img4.image = pergunta.respostas[3].img
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
        Bundle.main.loadNibNamed("ImageCardView", owner: self, options: nil)
        addSubview(view)
        
        view.frame = self.bounds
        view.layer.cornerRadius = C.cornerRadius
        view.layer.masksToBounds = false
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        btn1.clipsToBounds = true
        btn2.clipsToBounds = true
        btn3.clipsToBounds = true
        btn4.clipsToBounds = true
        
        
        btn1.layer.cornerRadius = C.cornerRadius
        btn2.layer.cornerRadius = C.cornerRadius
        btn3.layer.cornerRadius = C.cornerRadius
        btn4.layer.cornerRadius = C.cornerRadius
        
        img1.clipsToBounds = true
        img2.clipsToBounds = true
        img3.clipsToBounds = true
        img4.clipsToBounds = true
        
        img1.layer.cornerRadius = C.cornerRadius
        img2.layer.cornerRadius = C.cornerRadius
        img3.layer.cornerRadius = C.cornerRadius
        img4.layer.cornerRadius = C.cornerRadius
        
        btn1.transform = CGAffineTransform(scaleX: 1.075, y: 1.075)
        btn2.transform = CGAffineTransform(scaleX: 1.075, y: 1.075)
        btn3.transform = CGAffineTransform(scaleX: 1.075, y: 1.075)
        btn4.transform = CGAffineTransform(scaleX: 1.075, y: 1.075)
        
    }
    
    private func selectAlt(btn: UIButton, lbl: UILabel, img: UIImageView) {
        //Verifica se o usuario pode selecionar outra alternativa
        if !gameOver {
            //Reset all values
            btn1.alpha = 1
            btn2.alpha = 1
            btn3.alpha = 1
            btn4.alpha = 1
            
            btn1.backgroundColor = .clear
            btn2.backgroundColor = .clear
            btn3.backgroundColor = .clear
            btn4.backgroundColor = .clear
            
            btn1.layer.borderColor = UIColor.clear.cgColor
            btn2.layer.borderColor = UIColor.clear.cgColor
            btn3.layer.borderColor = UIColor.clear.cgColor
            btn4.layer.borderColor = UIColor.clear.cgColor
            
            label1.font = UIFont.systemFont(ofSize: C.fontSizeForAlternativaImgs)
            label2.font = UIFont.systemFont(ofSize: C.fontSizeForAlternativaImgs)
            label3.font = UIFont.systemFont(ofSize: C.fontSizeForAlternativaImgs)
            label4.font = UIFont.systemFont(ofSize: C.fontSizeForAlternativaImgs)
            
            label1.textColor = .black
            label2.textColor = .black
            label3.textColor = .black
            label4.textColor = .black
            
            //Destaca quem precisa ser destacado
            lbl.font = UIFont.boldSystemFont(ofSize: C.fontSizeForAlternativaImgs)
            lbl.textColor = bgColor ?? .black
            
            //        btn.alpha = 0.6
            btn.layer.borderWidth = 2.5
            
            let alpha: CGFloat = 0.25
            
            if let bgColor = bgColor {
                btn.backgroundColor = bgColor.withAlphaComponent(alpha)
                btn.layer.borderColor = bgColor.cgColor
            }else{
                btn.backgroundColor = UIColor.black.withAlphaComponent(alpha)
                btn.layer.borderColor = UIColor.black.cgColor
            }
            
            //        img.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }
        
    }
    
    func setLetrasColor(to: UIColor){
        //        label1.textColor = to
        //        label2.textColor = to
        //        label3.textColor = to
        //        label4.textColor = to
    }
    
    override func showFeedback() {
        guard let pergunta = perguntaObj, let alt = alternativaSelecionada else {return}
        let alpha: CGFloat = 0.60
        let certa = pergunta.certa()
        let btn = btnFor(alternativa: certa)
        btn.backgroundColor = UIColor(red: 100/255, green: 170/255, blue: 23/255, alpha: alpha)
        btn.layer.borderColor = btn.backgroundColor?.cgColor ?? UIColor.clear.cgColor
        btn.layer.borderWidth = 2.5
        
        if certa != alt {
            let btn = btnFor(alternativa: alt)
            btn.backgroundColor = UIColor(red: 208/255, green: 2/255, blue: 27/255, alpha: alpha)
            btn.layer.borderColor = btn.backgroundColor?.cgColor ?? UIColor.clear.cgColor
            btn.layer.borderWidth = 2.5
        }
    }
    
    private func btnFor(alternativa: String) -> UIButton{
        switch alternativa {
        case label1.text ?? "":
            return btn1
        case label2.text ?? "":
            return btn2
        case label3.text ?? "":
            return btn3
        case label4.text ?? "":
            return btn4
        default:
            return btn4
        }
    }
    
    @IBAction func touchBtn1(_ sender: UIButton) {
        alternativaSelecionada = label1.text
        selectAlt(btn: btn1, lbl: label1, img: img1)
    }
    
    @IBAction func touchBtn2(_ sender: UIButton) {
        alternativaSelecionada = label2.text
        selectAlt(btn: btn2, lbl: label2, img: img2)
    }
    
    @IBAction func touchBtn3(_ sender: UIButton) {
        alternativaSelecionada = label3.text
        selectAlt(btn: btn3, lbl: label3, img: img3)
    }
    
    @IBAction func touchBtn4(_ sender: UIButton) {
        alternativaSelecionada = label4.text
        selectAlt(btn: btn4, lbl: label4, img: img4)
    }
    
}
