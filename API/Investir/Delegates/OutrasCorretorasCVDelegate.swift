//
//  OutrasCorretorasCVDelegate.swift
//  API
//
//  Created by Guilherme Gatto on 23/11/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import Foundation
import UIKit
class OutrasCorretorasCVDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    
    let cellScalingHeigth: CGFloat = 0.4
    let cellScalingWidth: CGFloat = 0.9
    var collectionView: UICollectionView
    let viewController: UIViewController
    
    var corretoras: [CorretoraBE]{
        
        didSet{
            collectionView.reloadData()
        }
        
    }
    
    init(collectionView: UICollectionView, corretoras: [CorretoraBE], viewController: UIViewController) {
        self.collectionView = collectionView
        self.corretoras = corretoras
        self.viewController = viewController
        
        collectionView.layer.cornerRadius = C.cornerRadius
        super.init()
        collectionView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0 )
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return corretoras.count
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        
        switch indexPath.section {
        case 0:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellTransparente", for: indexPath as IndexPath) as!DetalhesCorretoraTransparenteCollectionViewCell
        case 1:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "outrasCorretorasCell", for: indexPath as IndexPath) as! OutrasCorretorasCollectionViewCell
            setupCollectionCellDesign(cell: cell)
            
            let c = cell as! OutrasCorretorasCollectionViewCell
            
            c.title.text = corretoras[indexPath.row].nome
            c.about.text = corretoras[indexPath.row].descricao
            
            if let imgString = corretoras[indexPath.row].fotoSobre {
                
                if let imagem = UIImage(data: Data(base64Encoded: imgString)!){
                    c.image.image = imagem
                }
                
            }
            cell = c
        default:
            break
        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize = collectionView.frame.size
        let cellWidth = floor(screenSize.width * cellScalingWidth)
        let cellHeight = floor(screenSize.height * cellScalingHeigth)
        
        switch indexPath.section {
        case 0:
            return CGSize(width: cellWidth, height: cellHeight*0.3)
        default:
            return CGSize(width: cellWidth, height: cellHeight)
        }
    }
    
    
    func setupCollectionCellDesign(cell: UICollectionViewCell){
        
        let corretoraCell = cell

        //Celula
        
        //Borda
        corretoraCell.layer.cornerRadius = 10
        
        //Sombra
        corretoraCell.clipsToBounds = false
        corretoraCell.backgroundColor = .white
        
        corretoraCell.shadowWithBlur()
        
    }

    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset)
        let controller = self.viewController as? OutrasCorretorasViewController
        controller?.stretchNavBar(y: scrollView.contentOffset.y)
    }
}
