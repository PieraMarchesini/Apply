//
//  DetalhesObjetivosCVDelegate.swift
//  API
//
//  Created by Guilherme Gatto on 04/12/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import Foundation
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

class DetalhesObjetivosCVDelegate: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate, UICollectionViewDelegateFlowLayout{
    
    let cellScalingHeigth: CGFloat = 0.60
    let cellScalingWidth: CGFloat = 0.90
    var collectionView: UICollectionView
    let viewController: UIViewController
    let objetivo: Objetivo
    
    init(collectionView: UICollectionView, viewController: UIViewController, objetivo: Objetivo) {
        self.collectionView = collectionView
        self.viewController = viewController
        self.objetivo = objetivo
        super.init()
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 50, right: 0)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
            let formatter = NumberFormatter()
            formatter.locale = Locale.current
            formatter.numberStyle = .currency
        
        switch indexPath.section {
            
        case 0:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellTransparente", for: indexPath as IndexPath) as! DetalhesCorretoraTransparenteCollectionViewCell
//            cell.contentView.frame.size.height = 40
        case 1:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detalheTipoB", for: indexPath as IndexPath) as! DetalheObjetivoTipoBCollectionViewCell
            
            let c = cell as! DetalheObjetivoTipoBCollectionViewCell
            c.progressoBaixo.layer.cornerRadius = C.cornerRadius
            c.progressoCima.layer.cornerRadius = C.cornerRadius
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .short
            dateFormatter.timeStyle = .none
            
            dateFormatter.locale = Locale(identifier: "pt_BR")
            
            
            c.progressoCima.frame.size.width = c.progressoBaixo.frame.width/100 * CGFloat(Util.calculatePorcentagemMeta(obj: objetivo))
            if let valorFinal = formatter.string(from: NSNumber(value: objetivo.metaDinheiro)), let valorInvestido = formatter.string(from: NSNumber(value: Util.calculateTotalInvestido(obj: objetivo))) {
                c.valorFinal.text = valorFinal
                c.valorProgresso.text = valorInvestido

            }
            
            c.porcentagem.text = "\(Util.calculatePorcentagemMeta(obj: objetivo))%"
            c.dataFinal.text = "\(dateFormatter.string(from: objetivo.metaData))"
            
            cell.shadow()
            
        case 2:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detalheTipoA", for: indexPath as IndexPath) as! DetalheObjetivoTipoACollectionViewCell
            
            let c = cell as! DetalheObjetivoTipoACollectionViewCell
            
            c.graficoView.investimentoA = 0.5
            c.graficoView.investimentoB = 0.5
            c.investimentoAGraficoCima.text = "50"
            c.investimentoAGraficoCima.textColor = C.azulgrafico
            c.investimentoAGraficoBaixo.text = "%CDB"
            c.investimentoBGraficoCima.text = "50"
            c.investimentoBGraficoCima.textColor = C.verdegrafico
            c.investimentoBGraficoBaixo.text = "%Tesouro"
            c.investimentoATitulo.text = "CDB"
            c.investimentoATitulo.textColor = C.azulgrafico
            c.investimentoAValor.text = formatter.string(from: NSNumber(value: objetivo.investimentoMensal/2))
            c.investimentoBTitulo.text = "Tesouro IPCA"
            c.investimentoBTitulo.textColor = C.verdegrafico
            c.investimentoBValor.text = formatter.string(from: NSNumber(value: objetivo.investimentoMensal/2))
            cell.shadow()
            
        default:
            break
        }
        
        setupCollectionCellDesign(cell: cell)
        
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }
    
    func setupCollectionCellDesign(cell: UICollectionViewCell){
        
      
        cell.layer.cornerRadius = C.cornerRadius
        
  
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize = collectionView.frame.size
        let cellWidth = floor(screenSize.width * cellScalingWidth)
        let cellHeight = floor(screenSize.height * cellScalingHeigth)
        
        switch indexPath.section {
        case 0:
            return CGSize(width: cellWidth, height: cellHeight*0.35)
        default:
            return CGSize(width: cellWidth, height: cellHeight)
        }
    }
    

    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset)
        let controller = self.viewController as? DetalhesObjetivoViewController
        controller?.stretchNavBar(y: scrollView.contentOffset.y)
    }
}

