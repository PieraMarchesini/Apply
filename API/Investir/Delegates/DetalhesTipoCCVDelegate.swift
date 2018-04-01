//
//  DetalhesTipoCCVDelegate.swift
//  API
//
//  Created by Guilherme Gatto on 21/11/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import Foundation
import UIKit

class DetalhesTipoCCVDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    
    let cellScalingHeigth: CGFloat = 1
    let cellScalingWidth: CGFloat = 1
    var collectionView: UICollectionView
    var opinions: [OpiniaoBE]
    
    init(collectionView: UICollectionView, opinions: [OpiniaoBE]) {
        self.collectionView = collectionView
        self.opinions = opinions
        
        collectionView.layer.cornerRadius = C.cornerRadius
        super.init()
        setupCollectionSize()
        collectionView.reloadData()

        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return opinions.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        
        
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: "opinionCell", for: indexPath as IndexPath) as! OpinionCollectionViewCell
        setupCollectionCellDesign(cell: cell)
        
        let c = cell as! OpinionCollectionViewCell
        
        c.name.text = "\(opinions[indexPath.row].nome), \(opinions[indexPath.row].idade)"
        c.opinion.text = opinions[indexPath.row].comentario
        c.photo.image = Util.image(base64: opinions[indexPath.row].foto)
        
        c.photo.layer.cornerRadius = C.cornerRadius
        c.photo.clipsToBounds = true
        cell = c
        
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
    
    
    
    func setupCollectionCellDesign(cell: UICollectionViewCell){
        
        
        let corretoraCell = cell
        
        
        
        //Celula
        
        //Borda
        corretoraCell.layer.cornerRadius = 6
        
        //Sombra
        corretoraCell.clipsToBounds = false
        corretoraCell.backgroundColor = .white
//        corretoraCell.layer.shadowColor = UIColor.black.cgColor
//        corretoraCell.layer.shadowOffset = CGSize(width: 0, height: 0)
//
//        corretoraCell.layer.shadowOpacity = 0.2
//        corretoraCell.layer.shadowRadius = 2
        
        
        
        
    }
    
    
    func setupCollectionSize(){
        
        let screenSize = collectionView.frame.size
        let cellWidth = floor(screenSize.width * cellScalingWidth)
        let cellHeight = floor(screenSize.height * cellScalingHeigth)
        
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
    }
    
    
}
