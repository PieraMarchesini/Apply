//
//  FeedbackView.swift
//  API
//
//  Created by Giovanni Bruno on 16/11/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import UIKit

class FeedbackView: UIView {
    @IBOutlet var view: UIView!
    @IBOutlet weak var feedbackLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup(){
        Bundle.main.loadNibNamed("FeedbackView", owner: self, options: nil)
        addSubview(view)
        
        view.frame = self.bounds
        view.layer.cornerRadius = C.cornerRadius
        view.layer.masksToBounds = false
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]        
        
    }
    
    
}
