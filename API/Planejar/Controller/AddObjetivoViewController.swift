//
//  AddObjetivoViewController.swift
//  API
//
//  Created by Piera Marchesini on 04/12/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import UIKit

class AddObjetivoViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var outletParallaxView: ParallaxView!
    @IBOutlet weak var outletHeightParallaxView: NSLayoutConstraint!
    
    var addObjetivoDelegate: AddObjetivoDelegate?
    private var tipoObjetivo: TipoObjetivo?
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Setup Parallax View
        outletParallaxView.title = "Criar objetivo"
        outletParallaxView.backgroundImage = #imageLiteral(resourceName: "backgroungBlue")
        outletParallaxView.descriptionString = "Escolha um dos tipos abaixo que mais se adequa ao seu objetivo"
        outletParallaxView.constraintHeight = self.outletHeightParallaxView
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.backgroundColor = .white
        tabBarController?.tabBar.isHidden = true
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        addObjetivoDelegate = AddObjetivoDelegate(tableView: tableView, viewController: self)
        
        guard let delegate = addObjetivoDelegate else{return}
        
        tableView.delegate = delegate
        tableView.dataSource = delegate
        
    }
    
    func stretchNavBar(y position: CGFloat){
        self.outletParallaxView.collapseView(y: position)
    }
    
    func nextStep(type: String) {
        self.tipoObjetivo = TipoObjetivo(rawValue: type)
        //TODO: - SEPARAR ENTRE META, EMERGÊNCIA OU RENDA MENSAL
        self.performSegue(withIdentifier: "toAddObjetivoMeta", sender: self)
        if let indexPaths = self.tableView.indexPathsForSelectedRows {
            for indexPath in indexPaths {
                self.tableView.deselectRow(at: indexPath, animated: true)
            }
        }
    }
    
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddObjetivoMeta" {
            if let destination = segue.destination as? AddObjetivoMetaViewController {
                guard let tipo = tipoObjetivo else {return}
                destination.tipo = tipo
            }
        }
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.setNavigationBarHidden(false, animated: true)
        tabBarController?.tabBar.isHidden = false
        self.navigationController?.popViewController(animated: true)
    }
    
    
}

