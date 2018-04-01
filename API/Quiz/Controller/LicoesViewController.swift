//
//  LicoesViewController.swift
//  API
//
//  Created by Giovanni Bruno on 07/11/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import UIKit

class LicoesViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var descricaoLabel: UILabel!
    
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var imagemNav: UIImageView!
    
    var categoria: Categoria!
    
    var lastContentOffset: CGPoint = .zero
    
    var indexPath: IndexPath?
    
    var pressedLicao: Licao?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func voltarTocado(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarController?.tabBar.isHidden = true
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (collectionView.frame.width * 0.75), height: (collectionView.frame.width * 0.7))
        
        layout.scrollDirection = .horizontal
        
        let leftInset = (view.frame.width / 2) - (collectionView.frame.width * 0.75) / 2
        collectionView.contentInset = UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: leftInset)
        
        collectionView.collectionViewLayout = layout
        collectionView.delegate = self
        collectionView.dataSource = self
        
        if categoria.licoes.count >= 1 && !categoria.dicaDoDia{
            collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .left, animated: true)
        }else if categoria.licoes.count >= 1 && categoria.dicaDoDia{
            collectionView.scrollToItem(at: IndexPath(item: categoria.licoes.count-1, section: 0), at: .left, animated: true)
        }

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        calculateClosestToCenter()
        pressedLicao = nil
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let categoria = categoria else {return}
        
        categoria.licoes.sort { (l1, l2) -> Bool in
            return l1.indice < l2.indice
        }
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.tintColor = UIColor.white
        

        
        imagemNav.image = categoria.imagemNavigation
        nomeLabel.text = categoria.nome
        descricaoLabel.text = categoria.descricaoCurta
        
        nomeLabel.textColor = .white
        descricaoLabel.textColor = .white
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calculateClosestToCenter() {
        guard let scrollView = collectionView else {return}
        let centerX = scrollView.contentOffset.x + scrollView.frame.size.width/2
        for cell in collectionView.visibleCells {
            
            var offsetX = centerX - cell.center.x
            if offsetX < 0 {
                offsetX *= -1
            }
            
            cell.transform = CGAffineTransform(scaleX: 1, y: 1)
            
            
            if offsetX > 50 {
                
                let offsetPercentage = (offsetX - 50) / view.bounds.width
                var scaleX = 1-offsetPercentage
                
                if scaleX < 0.8 {
                    scaleX = 0.8
                }
                cell.transform = CGAffineTransform(scaleX: scaleX, y: scaleX)
            }else{
                indexPath = collectionView.indexPath(for: cell)
            }
            
            
        }
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? PerguntasViewController {
            guard let licao = pressedLicao else {return}
            destination.licao = licao
//            destination.categoria = categoria
        }
    }

}

extension LicoesViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoria.licoes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: C.licoesCell, for: indexPath) as! LicoesCollectionViewCell
        
        if indexPath.item != 0 {
            cell.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }
        
        let licao = categoria.licoes[indexPath.item]
                
        cell.descricaoLabel.text = licao.descricaoCurta
        cell.nomeLabel.text = licao.nome
        
        cell.backgroundColor = licao.bgColor
        cell.layer.cornerRadius = 5
        cell.clipsToBounds = true
        cell.saberMaisButton.layer.cornerRadius = 5
        cell.saberMaisButton.tintColor = licao.bgColor
        
        cell.callback = {
            self.pressedLicao = licao
            self.performSegue(withIdentifier: C.licoesToPergunta, sender: self)
        }
        
        return cell
    }
}

extension LicoesViewController : UIScrollViewDelegate, UICollectionViewDelegate
{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        calculateClosestToCenter()
    }
}
