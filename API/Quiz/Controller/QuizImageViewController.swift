//
//  QuizImageViewController.swift
//  API
//
//  Created by Guilherme Gatto on 11/11/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import UIKit

class QuizImageViewController: UIViewController {

    @IBOutlet weak var pergunta: UILabel!
    
    @IBOutlet weak var imgOp1: UIImageView!
    @IBOutlet weak var imgOp2: UIImageView!
    @IBOutlet weak var imgOp3: UIImageView!
    @IBOutlet weak var imgOp4: UIImageView!
    
    @IBOutlet weak var lblOp1: UILabel!
    @IBOutlet weak var lblOp2: UILabel!
    @IBOutlet weak var lblOp3: UILabel!
    @IBOutlet weak var lblOp4: UILabel!
    
    @IBOutlet weak var btop4: UIButton!
    @IBOutlet weak var btop3: UIButton!
    @IBOutlet weak var btop2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    @IBOutlet weak var btop1: UIButton!
    func verificaCorreta(){
      
        
        
    }
    
    @IBAction func op1(_ sender: UIButton) {
        print("nnnnn")
        verificaCorreta()
    }
    
    @IBAction func op2(_ sender: UIButton) {
        verificaCorreta()
    }
    
    @IBAction func op3(_ sender: Any) {
        verificaCorreta()
    }
    
    @IBAction func op4(_ sender: UIButton) {
        verificaCorreta()
    }
    
}
