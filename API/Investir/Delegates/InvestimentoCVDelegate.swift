//
//  InvestimentoCVDelegate.swift
//  API
//
//  Created by Guilherme Gatto on 16/11/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import Foundation
import UIKit

class InvestimentoCVDelegate: NSObject, UICollectionViewDataSource, UICollectionViewDelegate{
    
    let cellScalingHeigth: CGFloat = 0.25
    let cellScalingWidth: CGFloat = 0.9
    var collectionView: UICollectionView
    let investimentos: [Investimento]
    
    init(collectionView: UICollectionView, investimentos: [Investimento]) {
        self.collectionView = collectionView
        self.investimentos = investimentos
        super.init()
        setupCollectionSize()
        
//        print(collectionView.frame.height / 3)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return investimentos.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "investimentoCell", for: indexPath as IndexPath) as! InvestimentoCollectionViewCell
        setupCollectionCellDesign(cell: cell)
        cell.banner.backgroundColor = investimentos[indexPath.row].color
        cell.title.text = investimentos[indexPath.row].title
        cell.subtitle.text = investimentos[indexPath.row].subtitle
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }
    
    func setupCollectionCellDesign(cell: UICollectionViewCell){
        
        
        let corretoraCell = cell as! InvestimentoCollectionViewCell
        
        
        //Celula
        
        //Borda
        corretoraCell.layer.cornerRadius = C.cornerRadius
        
        // banner
        
        corretoraCell.banner.layer.cornerRadius = C.cornerRadius
        corretoraCell.banner.shadow()
        
        
        
    }
    
    func setupCollectionSize(){
        
        let screenSize = collectionView.frame.size
        let cellWidth = floor(screenSize.width * cellScalingWidth)
        let cellHeight = floor(screenSize.height * cellScalingHeigth)
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 5, right: 10)
        
    }
    
    
}
