//
//  DetalhesObjetivoViewController.swift
//  API
//
//  Created by Guilherme Gatto on 04/12/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import UIKit

class DetalhesObjetivoViewController: UIViewController {

    @IBOutlet weak var outletParallaxView: ParallaxView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var objetivo: Objetivo?

    @IBOutlet weak var heightConstraintParallaxView: NSLayoutConstraint!
    var detalhesDelegate: DetalhesObjetivosCVDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detalhesDelegate = DetalhesObjetivosCVDelegate(collectionView: collectionView, viewController: self, objetivo: objetivo!)
        
        guard let delegate = detalhesDelegate else {return}
        
        collectionView.delegate = delegate
        collectionView.dataSource = delegate
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
    }
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        if gesture.direction == UISwipeGestureRecognizerDirection.right {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.setNavigationBarHidden(false, animated: true)
        tabBarController?.tabBar.isHidden = false
        self.navigationController?.popViewController(animated: true)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        
        if let valorMensal = formatter.string(from: NSNumber(value: (objetivo?.investimentoMensal)!)), let valorInvestido = formatter.string(from: NSNumber(value: Util.calculateTotalInvestido(obj: objetivo!))) {
            //ParallaxView Setup
            self.outletParallaxView.backgroundImage = #imageLiteral(resourceName: "backgroundGreen")
            self.outletParallaxView.title = objetivo?.nome
            self.outletParallaxView.descriptionString = "Contribuição mensal: \(valorMensal)\nInvestido até agora: \(valorInvestido)"
            self.outletParallaxView.constraintHeight = self.heightConstraintParallaxView
            
        }
        
        if let desc1 = objetivo?.investimentoMensal {
           
        }
        
       
        
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.backgroundColor = .white
        tabBarController?.tabBar.isHidden = true
        
    }
    
    
    func stretchNavBar(y position: CGFloat){
        self.outletParallaxView.collapseView(y: position)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

}
