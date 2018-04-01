//
//  AddObjetivoPt2MetaViewControllerViewController.swift
//  API
//
//  Created by Piera Marchesini on 06/12/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import UIKit

class AddObjetivoPt2MetaViewControllerViewController: UIViewController {
    
    @IBOutlet weak var outletParallaxView: ParallaxView!
    @IBOutlet weak var outletHeightParallaxView: NSLayoutConstraint!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var outletButton: UIButton!
    
    //Dados do Objetivo
    var tipoObjetivo: TipoObjetivo?
    var nomeObjetivo: String?
    var metaDinheiro: Double?
    var metaData: Date?
    
    var objetivo: Objetivo?
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Setup Parallax View
        outletParallaxView.title = "Criar objetivo"
        outletParallaxView.backgroundImage = #imageLiteral(resourceName: "backgroungBlue")
        outletParallaxView.descriptionString = "Preencha o restante das informações para finalizar"
        outletParallaxView.constraintHeight = self.outletHeightParallaxView
        
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.backgroundColor = .white
        tabBarController?.tabBar.isHidden = true
        
        //Button
        self.outletButton.layer.cornerRadius = 5
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addGoal(_ sender: Any) {
        let tableView = containerView.subviews.first as? UITableView
        let investimentoInicial = (tableView!.delegate! as! AddObjetivoPt2TableViewController).textFieldInvestimentoInicial.text
        let investimentoMensal = (tableView!.delegate! as! AddObjetivoPt2TableViewController).textFieldInvestimentoMensal.text
        
        if investimentoInicial == "" || investimentoMensal  == "" {
            let alert = UIAlertController(title: "Inválido", message: "Os campos não foram preenchidos", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            alert.view.tintColor = UIColor(red: 64/255, green: 114/255, blue: 165/255, alpha: 1)
            self.present(alert, animated: true, completion: nil)
        } else {
            self.objetivo = Objetivo(nome: self.nomeObjetivo!, metaDinheiro: self.metaDinheiro!, dataInicial: Date(), metaData: self.metaData!, investimentoInicial: Double(investimentoInicial!)!, investimentoMensal: Double(investimentoMensal!)!, tipo: self.tipoObjetivo!)
            self.performSegue(withIdentifier: "toPlanejar", sender: self)
        }
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPlanejar" {
            if let destination = segue.destination as? Planejar2ViewController {
                guard let objetivoConcluido = self.objetivo else { return }
                destination.objetivos.append(objetivoConcluido)
            }
        }
    }
}
