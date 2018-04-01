//
//  ObjetivosCVDelegate.swift
//  API
//
//  Created by Guilherme Gatto on 04/12/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import Foundation
import UIKit
import CoreGraphics

class ObjetivosCVDelegate: NSObject, UICollectionViewDataSource, UICollectionViewDelegate{
    
    let cellScalingHeigth: CGFloat = 0.95
    let cellScalingWidth: CGFloat = 0.5
    var collectionView: UICollectionView
    
    
    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
        super.init()
        setupCollectionSize()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "objetivosCelula", for: indexPath as IndexPath) as! ObjetivosCollectionViewCell
        setupCollectionCellDesign(cell: cell)
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }
    
    func setupCollectionCellDesign(cell: UICollectionViewCell){
        
        
        let corretoraCell = cell as! ObjetivosCollectionViewCell
        
        
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
        let insetX = (collectionView.bounds.width - cellWidth) / 2.0
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: insetX)
        

        layout.minimumInteritemSpacing = 50
        layout.minimumLineSpacing = 50
        
        collectionView.collectionViewLayout = layout
        
        
    }
    
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let screenSize = collectionView.frame.size
//        let cellWidth = floor(screenSize.width * cellScalingWidth)
//        let cellHeight = floor(screenSize.height * cellScalingHeigth)
//
//        return CGSize(width: cellWidth, height: cellHeight)
//
//    }
}

