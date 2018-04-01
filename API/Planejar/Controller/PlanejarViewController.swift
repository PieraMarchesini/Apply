//
//  PlanejarViewController.swift
//  API
//
//  Created by Guilherme Gatto on 04/12/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import UIKit

class PlanejarViewController: UIViewController {

    @IBOutlet weak var objetivosCollectionView: UICollectionView!
    @IBOutlet weak var resumoCollectionView: UICollectionView!
    
    
    var objetivosDelegate : ObjetivosCVDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        objetivosDelegate = ObjetivosCVDelegate(collectionView: objetivosCollectionView)
        
        guard let delegate = objetivosDelegate else {return}
        
        objetivosCollectionView.delegate = delegate
        objetivosCollectionView.dataSource = delegate
        
        navigationController?.navigationBar.shadowImage = UIImage()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.backgroundColor = .white
        tabBarController?.tabBar.isHidden = false
        
    }


    @IBAction func addGoalPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "toAddObjetivo", sender: self)
    }
    

}
