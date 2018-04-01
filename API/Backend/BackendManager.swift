//
//  BackendManager.swift
//  API
//
//  Created by Giovanni Bruno on 22/11/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import Foundation

class BackendManager {
    
    static let shared = BackendManager()
    
    private init(){}
    
    func buscaTodasCorretoras(completion: @escaping ([CorretoraBE]) -> Void) {
        var request = URLRequest(url: URL(string: End.corretoras)!)
        request.httpMethod = "GET"
        request.addValue("Content-Type", forHTTPHeaderField: "application/json")
        let session = URLSession.shared
        
        session.dataTask(with: request) { data, response, err in
            print("Entered the completionHandler")
            if err == nil {
                do{
                    guard let data = data else {return}
                    let corretoras = try JSONDecoder().decode([CorretoraBE].self, from: data)
                    completion(corretoras)
                }catch let e{
                    print(e.localizedDescription)
                    
                }
            }else{
                print(err.debugDescription)
            }
        }.resume()
    }
    
    
    func buscaTodasCategorias(completion: @escaping ([CategoriaBE]) -> Void) {
        var request = URLRequest(url: URL(string: End.categorias)!)
        request.httpMethod = "GET"
        request.addValue("Content-Type", forHTTPHeaderField: "application/json")
        let session = URLSession.shared
        
        session.dataTask(with: request) { data, response, err in
            print("Entered the completionHandler")
            if err == nil {
                do{
                    guard let data = data else {return}
                    let categorias = try JSONDecoder().decode([CategoriaBE].self, from: data)
                    completion(categorias)
                }catch let e{
                    print(e.localizedDescription)
                    
                }
            }else{
                print(err.debugDescription)
            }
            }.resume()
    }
    
}
