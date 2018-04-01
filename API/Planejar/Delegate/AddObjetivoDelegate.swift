//
//  AddObjetivoDelegate.swift
//  API
//
//  Created by Piera Marchesini on 05/12/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import UIKit

class AddObjetivoDelegate: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    let tableView: UITableView
    let viewController: UIViewController
    
    let typeObjective: [(name: String, description: String, example: String)] = [(name: TipoObjetivo.Meta.rawValue, description: "Alcançar um valor em um tempo determinado", example: "Ex: Viagem de formatura da graduação"), (name: TipoObjetivo.Emergencia.rawValue, description: "Ter uma reserva rápida para qualquer emergência", example: "Ex: Ocorreu um acidente e está sem trabalhar "), (name: TipoObjetivo.RendaMensal.rawValue, description: "Ter uma renda mensal para poder usufruir no futuro", example: "Ex: Aposentadoria")]
    
    
    init(tableView: UITableView, viewController: UIViewController) {
        self.tableView = tableView
        self.viewController = viewController
        super.init()
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "addObjetivoCell", for: indexPath) as! TipoObjetivoTableViewCell
        cell.outletTitle.text = typeObjective[indexPath.row].name
        cell.outletDescription.text = typeObjective[indexPath.row].description
        cell.outletExample.text = typeObjective[indexPath.row].example
        
        return cell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return typeObjective.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = self.viewController as? AddObjetivoViewController
        controller?.nextStep(type: typeObjective[indexPath.row].name)
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let controller = self.viewController as? AddObjetivoViewController
        controller?.stretchNavBar(y: scrollView.contentOffset.y)
    }
    

}
