//
//  OutrasCorretorasViewController.swift
//  API
//
//  Created by Guilherme Gatto on 23/11/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import UIKit

class OutrasCorretorasViewController: UIViewController {

    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var descricao: UILabel!
    
    @IBOutlet weak var parallaxView: ParallaxView!
    @IBOutlet weak var parallaxConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var corretoras : [CorretoraBE] = [] {
        didSet{
            guard let delegate = outrasCorretorasDelegate else {return}
            delegate.corretoras = corretoras
        }
    }
    
    var outrasCorretorasDelegate: OutrasCorretorasCVDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        outrasCorretorasDelegate = OutrasCorretorasCVDelegate(collectionView: collectionView, corretoras: corretoras, viewController: self)
        guard let delegate = outrasCorretorasDelegate else { return }
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.backgroundColor = .white
        tabBarController?.tabBar.isHidden = true
        
        //ParallaxView Setup
        self.parallaxView.backgroundImage = #imageLiteral(resourceName: "Artboard")
        self.parallaxView.title = "Outras Corretoras"
        self.parallaxView.descriptionString = "Corretoras confiáveis com as menores taxas do mercado"
        self.parallaxView.constraintHeight = self.parallaxConstraint
    }
    
    @IBAction func backButton(_ sender: Any) {
        navigationController?.navigationBar.popItem(animated: true)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func stretchNavBar(y position: CGFloat){
        self.parallaxView.collapseView(y: position)
    }
}
