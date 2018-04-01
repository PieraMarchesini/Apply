//
//  Planejar2ViewController.swift
//  API
//
//  Created by Giovanni Bruno on 05/12/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import UIKit

class Planejar2ViewController: UIViewController {
    
    let seguePlanejarToDetalhesObjetivo = "planejarToDetalhesObjetivo"
    let seguePlanejarToAddObjetivo = "planejarToAddObjetivo"
    
    let cellScalingHeigth: CGFloat = 0.90
    let cellScalingWidth: CGFloat = 0.46
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var objetivosLabel: UILabel!
    
    @IBOutlet weak var investindoValueLabel: UILabel!
    
    @IBOutlet weak var patrimonioValueLabel: UILabel!
    
    @IBOutlet weak var rentabilidadeValueLabel: UILabel!
    
    @IBOutlet weak var objetivosValueLabel: UILabel!
    
    var objetivos: [Objetivo] = []
    
    var objSelecionado: Objetivo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        collectionView.delegate = self
        collectionView.dataSource = self

        setupCollectionSize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.backItem?.hidesBackButton = true
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationItem.hidesBackButton = true
        
        //Mockado
            let obj1 = Objetivo.init(nome: "Objetivo do Batman", metaDinheiro: 1000000, dataInicial: Util.date(day: 18, month: 03, year: 2013), metaData: Util.date(day: 20, month: 04, year: 2030), investimentoInicial: 1_000, investimentoMensal: 1_000, tipo: TipoObjetivo.RendaMensal)
            objetivos.append(obj1)
        
        let obj2 = Objetivo.init(nome: "Formatura", metaDinheiro: 25000, dataInicial: Util.date(day: 20, month: 09, year: 2017), metaData: Util.date(day: 20, month: 12, year: 2018), investimentoInicial: 1_000, investimentoMensal: 250, tipo: TipoObjetivo.RendaMensal)
        objetivos.append(obj2)
        
        
        let obj3 = Objetivo.init(nome: "Viagem", metaDinheiro: 20000, dataInicial: Util.date(day: 18, month: 03, year: 2017), metaData: Util.date(day: 20, month: 04, year: 2030), investimentoInicial: 1_000, investimentoMensal: 100, tipo: TipoObjetivo.RendaMensal)
        objetivos.append(obj3)
        
        
    }
    
    @IBAction func addObjetivoPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "toAddObjetivo", sender: self)
    }
    
    
    
    func setupCollectionSize(){
        
        let screenSize = collectionView.frame.size
        let cellWidth = floor(screenSize.width * cellScalingWidth)
        let cellHeight = floor(screenSize.height * cellScalingHeigth)
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        collectionView.collectionViewLayout = layout
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let d = segue.destination as? DetalhesObjetivoViewController {
            guard let objSelecionado = objSelecionado else {return}
            
            d.objetivo = objSelecionado
        }
    }

}


extension Planejar2ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        objSelecionado = objetivos[indexPath.row]
        performSegue(withIdentifier: seguePlanejarToDetalhesObjetivo, sender: self)
    }
}

extension Planejar2ViewController: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
            return objetivos.count
    }
    
    

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "planejarCell69", for: indexPath) as! PlanejarCollectionViewCell
        
        let obj = objetivos[indexPath.item]
        
        cell.backgroundColor = C.azul
        
        cell.shadow()

        cell.layer.cornerRadius = C.cornerRadius
        
        cell.editCallback = {print("GO TO EDIT")}
        
        cell.titleLabel.text = obj.nome
        
        let percentagem = Util.calculatePorcentagemMeta(obj: obj)
        
        cell.percentageLabel.text = String("\(percentagem)%")
        
        cell.percentage = CGFloat((percentagem > 100 ? 100: percentagem)/100)
        
        
        return cell
    }
    
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

}
