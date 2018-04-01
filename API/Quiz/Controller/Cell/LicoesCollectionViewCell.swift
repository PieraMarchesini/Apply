//
//  LicoesCollectionViewCell.swift
//  API
//
//  Created by Giovanni Bruno on 09/11/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import UIKit

class LicoesCollectionViewCell: UICollectionViewCell {
   
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var descricaoLabel: UILabel!
    @IBOutlet weak var saberMaisButton: UIButton!
    
    var callback: (()->Void)?
    
    @IBAction func saberMaisApertado(_ sender: UIButton) {
        
        if let cb = callback {
            cb()
        }
        
    }
    
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
    
        Util.addShadow(to: saberMaisButton)
    }
    
}
