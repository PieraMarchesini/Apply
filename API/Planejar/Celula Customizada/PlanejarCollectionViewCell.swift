//
//  PlanejarCollectionViewCell.swift
//  API
//
//  Created by Giovanni Bruno on 05/12/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import UIKit

class PlanejarCollectionViewCell: UICollectionViewCell {
    
    var editCallback: (() -> Void)?
    
    var percentage: CGFloat = 0
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backProgressBar: UIView!
    
    @IBOutlet weak var frontProgressBar: UIView!
    
    @IBOutlet weak var percentageLabel: UILabel!
    
    @IBAction func editPressed(_ sender: UIButton) {
        guard let editCallback = editCallback else {return}
        editCallback()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
    
        backProgressBar.layer.cornerRadius = C.cornerRadius
    
        frontProgressBar.layer.cornerRadius = C.cornerRadius
        frontProgressBar.alpha = 0.5
        frontProgressBar.frame.size.width *= percentage
        frontProgressBar.layer.borderWidth = 0.5
        frontProgressBar.layer.borderColor = UIColor.white.cgColor
    }
}
