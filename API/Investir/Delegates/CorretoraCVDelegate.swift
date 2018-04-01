//
//  CorretoraCVDelegate.swift
//  API
//
//  Created by Guilherme Gatto on 21/11/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import Foundation
import UIKit

class CorretoraCVDelegate: NSObject, UICollectionViewDataSource, UICollectionViewDelegate{
    
    
    let cellScalingHeigth: CGFloat = 0.95
    let cellScalingWidth: CGFloat = 0.5
    var collectionView: UICollectionView
    var corretoras: [CorretoraBE]
    var corretorasParceiras: [CorretoraBE]
    let view: UIViewController
    
  
    
    
    init(controller: UIViewController, collectionView: UICollectionView, corretoras: [CorretoraBE], corretorasParceiras: [CorretoraBE]) {
        self.collectionView = collectionView
        self.corretoras = corretoras
        self.view = controller
        self.corretorasParceiras = corretorasParceiras
        super.init()
        setupCollectionSize()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return corretorasParceiras.count + 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "corretoraCelula", for: indexPath as IndexPath) as! CorretoraCollectionViewCell
        setupCollectionCellDesign(cell: cell)
        
        if indexPath.row == corretorasParceiras.count {
            
            cell.banner.backgroundColor = C.azul
            cell.name.text = "Outras Corretoras"
            return cell
            
        }else{
            if let foto = corretorasParceiras[indexPath.row].fotoSobre{
                cell.banner.backgroundColor = corretorasParceiras[indexPath.row].cor.toUIColor()
            }
            
            cell.name.text = corretorasParceiras[indexPath.row].nome
            return cell
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        let v = view as! InvestirViewController
        
        if indexPath.row == corretorasParceiras.count {
            
            v.index = (indexPath.row, false)
        
        }else{
           
            v.index = (indexPath.row, true)
        }
    }
    
    
    
    func setupCollectionCellDesign(cell: UICollectionViewCell){
        
        
        let corretoraCell = cell as! CorretoraCollectionViewCell
        
        
        //Celula
        
        //Borda
        corretoraCell.layer.cornerRadius = 6
        
        //Sombra
        corretoraCell.clipsToBounds = true
        corretoraCell.layer.shadowColor = UIColor.black.cgColor
        corretoraCell.layer.shadowOffset = CGSize(width: 0, height: 5)
        corretoraCell.layer.shadowOpacity = 0.15
        corretoraCell.layer.shadowRadius = 2
        
        corretoraCell.name.text = "XP Investimentos"
        
        
        
    }
    
    
    func setupCollectionSize(){
        
        let screenSize = collectionView.frame.size
        let cellWidth = floor(screenSize.width * cellScalingWidth)
        let cellHeight = floor(screenSize.height * cellScalingHeigth)
        
        let insetX = (collectionView.bounds.width - cellWidth) / 2.0
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: insetX)
        
    }
    
}
