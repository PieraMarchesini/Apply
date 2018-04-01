//
//  Resposta.swift
//  API
//
//  Created by Giovanni Bruno on 24/11/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import UIKit

struct RespostaBE: Codable {
    let id: Int64
    let img: String?
    let correta: Bool
    let texto: String
    
    func toResposta() -> Resposta {
        var imagem: UIImage? = nil
        if let img = img {
            imagem = Util.image(base64: img)
        }
        return Resposta (texto: texto, img: imagem, correta: correta)
    }
}
