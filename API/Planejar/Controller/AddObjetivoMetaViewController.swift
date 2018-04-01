//
//  AddObjetivoMetaViewController.swift
//  API
//
//  Created by Piera Marchesini on 05/12/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import UIKit

class AddObjetivoMetaViewController: UIViewController {

    @IBOutlet weak var outletParallaxView: ParallaxView!
    @IBOutlet weak var outletHeightParallaxView: NSLayoutConstraint!
    @IBOutlet weak var outletButtonNext: UIButton!
    @IBOutlet weak var containerView: UIView!
    
    var tipo: TipoObjetivo?
    var name: String?
    var metaDinheiro: Double?
    var metaData: Date?
    
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
        outletParallaxView.descriptionString = "Preencha as seguintes informações sobre sua meta"
        outletParallaxView.constraintHeight = self.outletHeightParallaxView
        
       
        navigationController?.setNavigationBarHidden(true, animated: true)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.backgroundColor = .white
        tabBarController?.tabBar.isHidden = true
        
        //Button
        self.outletButtonNext.layer.cornerRadius = 5
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        let tableView = containerView.subviews.first as? UITableView
        let name = (tableView!.delegate! as! AddMetaTableViewController).textField.text
        let value = (tableView!.delegate! as! AddMetaTableViewController).textField2.text
        let date = (tableView!.delegate! as! AddMetaTableViewController).dataMeta
        
        if name == "" || value  == "" || date == nil {
            let alert = UIAlertController(title: "Inválido", message: "Os campos não foram preenchidos", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            alert.view.tintColor = UIColor(red: 64/255, green: 114/255, blue: 165/255, alpha: 1)
            self.present(alert, animated: true, completion: nil)
        } else {
            self.name = name
            self.metaDinheiro = Double(value!)
            self.metaData = date
            self.performSegue(withIdentifier: "toAddObjetivoPt2", sender: self)
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddObjetivoPt2" {
            if let destination = segue.destination as? AddObjetivoPt2MetaViewControllerViewController {
                guard let tipo = self.tipo,
                      let nomeObjetivo = self.name,
                      let metaDinheiro = self.metaDinheiro,
                      let metaData = self.metaData
                else {return}
                destination.tipoObjetivo = tipo
                destination.nomeObjetivo = nomeObjetivo
                destination.metaDinheiro = metaDinheiro
                destination.metaData = metaData
            }
        }
        
    }

}
