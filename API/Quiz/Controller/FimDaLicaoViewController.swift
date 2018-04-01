//
//  FimDaLicaoViewController.swift
//  API
//
//  Created by Giovanni Bruno on 11/11/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import UIKit

class FimDaLicaoViewController: UIViewController {
    
    @IBOutlet weak var aproveitamentoLabel: UILabel!
    
    @IBOutlet weak var continuarBtn: UIButton!
    
    var licao: Licao!
    
    var aproveitamento: (n1: Int, n2: Int)!
    
    @IBOutlet weak var licaoNomeLabel: UILabel!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        view.backgroundColor = licao.bgColor
        
        continuarBtn.layer.cornerRadius = C.cornerRadius
        continuarBtn.tintColor = licao.bgColor
        
        Util.addShadow(to: continuarBtn)
        
        licaoNomeLabel.text = licao.nome
        
        aproveitamentoLabel.text = "\(aproveitamento.n1)/\(aproveitamento.n2) de aproveitamento"
    }
    
    @IBAction func continuar(_ sender: UIButton) {
        guard let vcs = navigationController?.viewControllers else {return}
        for vc in vcs{
            if let vc = vc as? LicoesViewController {
                navigationController?.popToViewController(vc, animated: true)
            }
        }
    }
}
