//
//  DetalhesCorretoraViewController.swift
//  API
//
//  Created by Guilherme Gatto on 21/11/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import UIKit

class DetalhesCorretoraViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var outletParallaxView: ParallaxView!
    @IBOutlet weak var outletHeightParallaxViewConstraint: NSLayoutConstraint!
    
    var corretora: CorretoraBE?{
        didSet{
            guard let delegate = detalhesDelegate else {return}
            guard let corretora = corretora else {return}
            delegate.corretora = corretora
        }
    }

    
    var detalhesDelegate: DetalhesCVDelegate?
    var previousPositionCollection: CGFloat = -100.0
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        detalhesDelegate = DetalhesCVDelegate(collectionView: collectionView, corretora: corretora!, viewController: self)
        
        guard let delegate = detalhesDelegate else{return}
        
        collectionView.delegate = delegate
        collectionView.dataSource = delegate

    }
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        if gesture.direction == UISwipeGestureRecognizerDirection.right {
            self.navigationController?.popViewController(animated: true)
        } 
    }

    func stretchNavBar(y position: CGFloat){
        self.outletParallaxView.collapseView(y: position)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
        
        //ParallaxView Setup
        self.outletParallaxView.backgroundImage = #imageLiteral(resourceName: "NavRoxa")
        guard let corretora = corretora else { return }
        self.outletParallaxView.title = corretora.nome
        self.outletParallaxView.descriptionString = corretora.descricao
        self.outletParallaxView.constraintHeight = self.outletHeightParallaxViewConstraint

        
        navigationController?.setNavigationBarHidden(true, animated: true)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.backgroundColor = .white
        tabBarController?.tabBar.isHidden = true
        
    }

    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //MARK: - Actions
    @IBAction func pigButtonPressed(_ sender: Any) {
        guard let corretora = self.corretora else { return }
        UIApplication.shared.open(URL(string: corretora.webSite)!, options: [:], completionHandler: nil)
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.navigationBar.popItem(animated: true)
    }
    
}
