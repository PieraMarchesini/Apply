//
//  InvestirViewController.swift
//  API
//
//  Created by Guilherme Gatto on 15/11/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import UIKit

class InvestirViewController: UIViewController {
    
    @IBOutlet weak var investimentoCollectionView: UICollectionView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var segueNameToCorretorasDetails = "investirToDetailCorretora"
    var segueNameToOthersCorretoras = "investirToOutrasCorretoras"
    
    var delegateInvestimento: InvestimentoCVDelegate!
    var delegateCorretora: CorretoraCVDelegate!
    
    var index: (index: Int?, parceira: Bool)?{
        didSet{
            guard let index = index else {return}
            
            if index.parceira{
                performSegue(withIdentifier: segueNameToCorretorasDetails, sender: self)
            }else{
                performSegue(withIdentifier: segueNameToOthersCorretoras, sender: self)
            }
        }
    }
    
    var corretorasParceira: [CorretoraBE] = []
    
    
    
    var corretoras: [CorretoraBE] = [] {
        didSet{
            guard let cDelegate = delegateCorretora else {return}
            corretorasParceira = []
            for c in corretoras{
                if c.eParceira {
                    corretorasParceira.append(c)
                }
            }
            cDelegate.corretoras = corretoras
            cDelegate.corretorasParceiras = corretorasParceira
        }
    }
    
    var investimentos = [Investimento(title: "IPCA", subtitle: "Tesouro Direto", color: C.azul),
                         Investimento(title: "CDI", subtitle: "Tesouro Direto", color: C.roxo),
                         Investimento(title: "Selic", subtitle: "Tesouro Direto", color: C.laranja),
                         Investimento(title: "Pré Fixado", subtitle: "Tesouro Direto", color: C.verde),
                         Investimento(title: "Pós Fixado", subtitle: "Tesouro Direto", color: C.azul)]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegateCorretora = CorretoraCVDelegate(controller: self, collectionView: collectionView, corretoras: corretoras, corretorasParceiras: corretorasParceira)
        collectionView.delegate = delegateCorretora
        collectionView.dataSource = delegateCorretora
        
        delegateInvestimento = InvestimentoCVDelegate(collectionView: investimentoCollectionView, investimentos: investimentos)
        investimentoCollectionView.delegate = delegateInvestimento
        investimentoCollectionView.dataSource = delegateInvestimento
        
        navigationController?.navigationBar.shadowImage = UIImage()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.backgroundColor = .white
        tabBarController?.tabBar.isHidden = false
        
        BackendManager.shared.buscaTodasCorretoras(){ corretorasBE in
            DispatchQueue.main.sync {
                self.corretoras = corretorasBE
                self.collectionView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueNameToCorretorasDetails{
            if let destination = segue.destination as? DetalhesCorretoraViewController {
                guard let index = index?.index else {return}
                destination.corretora = corretorasParceira[index]
            }
        }else if segue.identifier == segueNameToOthersCorretoras {
            if let destination = segue.destination as? OutrasCorretorasViewController{
                destination.corretoras = corretoras
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
