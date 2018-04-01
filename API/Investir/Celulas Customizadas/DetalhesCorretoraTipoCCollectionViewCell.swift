//
//  DetalhesCorretoraTipoCCollectionViewCell.swift
//  API
//
//  Created by Guilherme Gatto on 21/11/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import UIKit

class DetalhesCorretoraTipoCCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var delegate: DetalhesTipoCCVDelegate?
    
    var opinion: [OpiniaoBE] = [] {
        didSet{
            delegate = DetalhesTipoCCVDelegate(collectionView: collectionView, opinions: opinion)
            guard let delegate = delegate else {return}
            
            collectionView.delegate = delegate
            collectionView.dataSource = delegate
            collectionView.reloadData()
            
        }
    }
    
}
