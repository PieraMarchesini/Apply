//
//  CategoriaCollectionViewController.swift
//  API
//
//  Created by Giovanni Bruno on 01/11/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import UIKit

class CategoriaCollectionViewController: UICollectionViewController {

    var categorias = [Categoria]()
    var categoriaSelecionada: Categoria?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.shadowImage = UIImage()

        BackendManager.shared.buscaTodasCategorias { (categorias) in
            var categoriasUI = [Categoria]()
            for c in categorias {
                categoriasUI.append(c.toCategoria())
            }
            DispatchQueue.main.sync {
                self.categorias = categoriasUI
                self.categorias.sort(by: { (c1, c2) -> Bool in
                    return c1.indice < c2.indice
                })
                self.collectionView?.reloadData()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Navigation


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vc = segue.destination as? LicoesViewController {
            vc.categoria = categoriaSelecionada
        }
        
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return categorias.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: C.categoriaCellIdentifier, for: indexPath) as! CategoriaCollectionViewCell

        let categoria = categorias[indexPath.item]
                
        cell.nomeLabel.text = categoria.nome
        cell.imageView.image = categoria.imagemCollection
        cell.layer.cornerRadius = 5
        cell.clipsToBounds = true
        return cell
    }
    
    

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        categoriaSelecionada = categorias[indexPath.item]
        
        if categoriaSelecionada != nil {
            performSegue(withIdentifier: C.aprendaToLicoes, sender: self)
        }
    }
 

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
