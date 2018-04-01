//
//  ParallaxView.swift
//  API
//
//  Created by Piera Marchesini on 24/11/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import UIKit

class ParallaxView: UIView {
    
    @IBOutlet var view: UIView!
    
    @IBOutlet weak var smallTitle: UILabel!
    @IBOutlet weak var bigTitle: UILabel!
    @IBOutlet weak var descriptionText: UILabel!
    @IBOutlet weak var image: UIImageView!
    var constraintHeight: NSLayoutConstraint?
    
    var backgroundImage:UIImage! {
        didSet{
            self.handleBackgroundImage()
        }
    }
    var title: String? {
        didSet{
            self.handleTitleLabel()
        }
    }
    var descriptionString: String? {
        didSet{
            self.handleDescriptionLabel()
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
        Bundle.main.loadNibNamed("ParallaxView", owner: self, options: nil)
        addSubview(view)
        
        view.frame = self.bounds
        view.layer.masksToBounds = false
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        
    }
    
    func collapseView(y:CGFloat){
        let minHeight: CGFloat = 0.13
        let maxHeight: CGFloat = 0.32
        if y > 0 && y < 132{
            constraintHeight = constraintHeight?.setMultiplier(multiplier: maxHeight-(y*0.0014))
            
            if y > 60 {
                smallTitle.alpha += y*0.0002
                bigTitle.alpha -= y*0.0003
                descriptionText.alpha -= y*0.0004
            }
            
            //TODO: MUDAR O TEXTO DE LUGAR - TRANSFORM
        }
        if y > 132 {
            constraintHeight = constraintHeight?.setMultiplier(multiplier: minHeight)
            smallTitle.alpha = 1
            bigTitle.alpha = 0
            descriptionText.alpha = 0
        } else if y < 0 {
            constraintHeight = constraintHeight?.setMultiplier(multiplier: maxHeight-(y*0.0013))
            smallTitle.alpha = 0
            bigTitle.alpha = 1
            descriptionText.alpha = 1
        }
        
        self.layoutIfNeeded()
    }
    
    //MARK: - SET
    private func handleBackgroundImage() {
        self.image.image = self.backgroundImage
    }
    
    private func handleTitleLabel() {
        self.smallTitle.text = self.title
        self.bigTitle.text = self.title
    }
    private func handleDescriptionLabel() {
        self.descriptionText.text = self.descriptionString
    }
}
