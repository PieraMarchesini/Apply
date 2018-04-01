//
//  DetalhesCVDelegate.swift
//  API
//
//  Created by Guilherme Gatto on 21/11/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import Foundation
import UIKit

class DetalhesCVDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate, UICollectionViewDelegateFlowLayout{
    
    
    let cellScalingHeigth: CGFloat = 0.4
    let cellScalingWidth: CGFloat = 0.90
    var collectionView: UICollectionView
    var corretora: CorretoraBE{
        didSet{
            collectionView.reloadData()
        }
    }
    
    var segueName = "investirToDetailCorretora"
    
    let viewController: UIViewController
    
    init(collectionView: UICollectionView, corretora: CorretoraBE, viewController: UIViewController) {
        self.collectionView = collectionView
        self.viewController = viewController
        self.corretora = corretora
        super.init()
        
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        
        switch indexPath.section {
        
        case 0:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellTransparente", for: indexPath as IndexPath) as!DetalhesCorretoraTransparenteCollectionViewCell
            cell.contentView.frame.size.height = 50
        case 1:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellTipoA", for: indexPath as IndexPath) as! DetalhesCorretoraTipoACollectionViewCell
            
            let c = cell as! DetalhesCorretoraTipoACollectionViewCell
            
            c.rendaFixaValue.text = "\(corretora.taxaRendaFixa)"
            c.rendaVariavelValue.text = "\(corretora.taxaRendaVariavel)"
            
            
            cell = c
             setupCollectionCellDesign(cell: cell)
        case 2:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellTipoB", for: indexPath as IndexPath) as! DetalhesCorretoraTipoBCollectionViewCell
            let c = cell as! DetalhesCorretoraTipoBCollectionViewCell
            
            c.about.text = corretora.sobre
            
            if let img = corretora.fotoSobre {
                c.img.image = UIImage(data: Data(base64Encoded: img)!)
            }
            c.img.clipsToBounds = true
            c.img.layer.cornerRadius = 50
            
            cell = c
             setupCollectionCellDesign(cell: cell)
        case 4:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellTipoC", for: indexPath as IndexPath) as! DetalhesCorretoraTipoCCollectionViewCell
            
            let c = cell as! DetalhesCorretoraTipoCCollectionViewCell
            
            if let opnioes = corretora.opinioes {
                c.opinion = opnioes
            }
            
            cell = c
             setupCollectionCellDesign(cell: cell)
        case 3:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellTipoD", for: indexPath as IndexPath) as! DetalhesCorretoraTipoDCollectionViewCell
            
            let c = cell as! DetalhesCorretoraTipoDCollectionViewCell
            c.title.text = "Diferencial"

            cell = c
             setupCollectionCellDesign(cell: cell)
        default:
            break
            
        }
       
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize = collectionView.frame.size
        let cellWidth = floor(screenSize.width * cellScalingWidth)
        let cellHeight = floor(screenSize.height * cellScalingHeigth)
        
        switch indexPath.section {
        case 0:
            return CGSize(width: cellWidth, height: cellHeight*0.45)
        default:
            return CGSize(width: cellWidth, height: cellHeight)
        }
    }
    
    
    
    func setupCollectionCellDesign(cell: UICollectionViewCell){
     
        let corretoraCell = cell
        //Borda
        corretoraCell.layer.cornerRadius = 10
        
        //Sombra
        corretoraCell.clipsToBounds = false
        corretoraCell.backgroundColor = .white
        
        corretoraCell.shadowWithBlur()
    }
    

    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset)
        let controller = self.viewController as? DetalhesCorretoraViewController
        controller?.stretchNavBar(y: scrollView.contentOffset.y)
    }
    
}
