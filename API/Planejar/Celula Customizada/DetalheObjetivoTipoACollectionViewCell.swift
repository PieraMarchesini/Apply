//
//  DetalheObjetivoTipoACollectionViewCell.swift
//  API
//
//  Created by Piera Marchesini on 05/12/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import UIKit

class DetalheObjetivoTipoACollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var graficoView: Grafico!
    
    @IBOutlet weak var investimentoAGraficoCima: UILabel!
    @IBOutlet weak var investimentoAGraficoBaixo: UILabel!
    
    @IBOutlet weak var investimentoBGraficoCima: UILabel!
    @IBOutlet weak var investimentoBGraficoBaixo: UILabel!
    
    @IBOutlet weak var investimentoATitulo: UILabel!
    @IBOutlet weak var investimentoAValor: UILabel!
    
    @IBOutlet weak var investimentoBTitulo: UILabel!
    @IBOutlet weak var investimentoBValor: UILabel!
    
}
