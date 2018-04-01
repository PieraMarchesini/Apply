//
//  QuizFactory.swift
//  API
//
//  Created by Giovanni Bruno on 09/11/17.
//  Copyright © 2017 Giovanni Bruno. All rights reserved.
//

import UIKit

class QuizFactory{
    
    static let shared = QuizFactory()
    
    private init() {}
    
    func fetchAll() -> [Categoria] {
        var categorias = [Categoria]()
        var catsCols = [UIImage]()
        var catsHeaders = [UIImage]()
        
        for i in 1...4 {
            catsCols.append(UIImage(named: "cat\(i)col")!)
            catsHeaders.append(UIImage(named: "cat\(i)header")!)
        }
       
        //CATEGORIA 1
        var licoes = [Licao]()
        var perguntas = [Pergunta]()
        var respostas = [Resposta]()
        
        var desc = "Dicas especializadas sobre finanças"
        let cat1 = Categoria(nome: "Dica do dia", imagemCollection: catsCols[0], imagemNavigation: catsHeaders[0], descricaoCurta: desc, licoes: licoes, dicaDoDia: true, indice: 0)
        
        categorias.append(cat1)
        
        //CATEGORIA 2
        licoes = [Licao]()
        //Licao 1
        perguntas = [Pergunta]()
        
        for _ in 1...3 {
            respostas = [Resposta]()
            respostas.append(Resposta(texto: "IPCA", img: UIImage(named: "cat1col"), correta: true))
            respostas.append(Resposta(texto: "PCA", img: UIImage(named: "cat2col"), correta: false))
            respostas.append(Resposta(texto: "PCC", img: UIImage(named: "cat3col"), correta: false))
            respostas.append(Resposta(texto: "DP", img: UIImage(named: "cat4col"), correta: false))
            
            
            perguntas.append(Pergunta(pergunta: "Índice de Preços ao Consumidor Amplo", explicacaoFinal: "", explicacaoCurta: "Conta Corrente Digital", imgExplicacaoFinal: nil, respostas: respostas, tipoPergunta: .imagens, indice: 1))
        }
        
        for _ in 1...3 {
            respostas = [Resposta]()
        respostas.append(Resposta(texto: "Conta Corrente Digital", img: nil, correta: true))
        respostas.append(Resposta(texto: "Bancos Internacionais", img: nil, correta: false))
        respostas.append(Resposta(texto: "Bancos nacionais", img: nil, correta: false))
        respostas.append(Resposta(texto: "Conta Corrente Tradicional", img: nil, correta: false))

        
            perguntas.append(Pergunta(pergunta: "Sem agência e sem taxa de manutenção", explicacaoFinal: "", explicacaoCurta: "Conta Corrente Digital", imgExplicacaoFinal: nil, respostas: respostas, tipoPergunta: .abcd, indice: 2))
        }
        
        
        licoes.append(LicaoPergunta(nome: "Como começar", descricaoCurta: "Dicas e macetes para você melhorar a sua vida financeiramente", perguntas: perguntas, bgColor: UIColor(red: 126/255, green: 161/255, blue: 79/255, alpha: 1), indice: 3))
        
        licoes.append(LicaoPergunta(nome: "Porcentagem", descricaoCurta: "Aprenda um pouco mais como as engrenagens funcionam", perguntas: perguntas, bgColor: UIColor(red: 126/255, green: 161/255, blue: 79/255, alpha: 1), indice: 4))
        
        licoes.append(LicaoPergunta(nome: "Rendimentos", descricaoCurta: "Descubra como rendem seus investimentos", perguntas: perguntas, bgColor: UIColor(red: 126/255, green: 161/255, blue: 79/255, alpha: 1), indice: 5))
        
        desc = "Primeiros passos da sua jornada"
        let cat2 = Categoria(nome: "Introdução", imagemCollection: catsCols[1], imagemNavigation: catsHeaders[1], descricaoCurta: desc, licoes: licoes, dicaDoDia: false, indice: 6)
        
        categorias.append(cat2)
        
        //CATEGORIA 3
        licoes = [Licao]()
        
        desc = "Para aprender um pouco mais"
        let cat3 = Categoria(nome: "Básico", imagemCollection: catsCols[2], imagemNavigation: catsHeaders[2], descricaoCurta: desc, licoes: licoes, dicaDoDia: false, indice: 7)
        
        categorias.append(cat3)
        
        //CATEGORIA 4
        licoes = [Licao]()
        
        //Licao 1
        perguntas = [Pergunta]()
        
        for _ in 1...3 {
            respostas = [Resposta]()
            respostas.append(Resposta(texto: "IPCA", img: UIImage(named: "cat1col"), correta: true))
            respostas.append(Resposta(texto: "PCA", img: UIImage(named: "cat2col"), correta: false))
            respostas.append(Resposta(texto: "PCC", img: UIImage(named: "cat3col"), correta: false))
            respostas.append(Resposta(texto: "DP", img: UIImage(named: "cat4col"), correta: false))
            
            
            perguntas.append(Pergunta(pergunta: "Índice de Preços ao Consumidor Amplo", explicacaoFinal: "", explicacaoCurta: "Conta Corrente Digital", imgExplicacaoFinal: nil, respostas: respostas, tipoPergunta: .imagens, indice: 8))
        }
        
        
        licoes.append(LicaoPergunta(nome: "Como começar", descricaoCurta: "Dicas e macetes para você melhorar a sua vida financeiramente", perguntas: perguntas, bgColor: UIColor(red: 145/255, green: 101/255, blue: 228/255, alpha: 1), indice: 9))
        
        licoes.append(LicaoPergunta(nome: "Porcentagem", descricaoCurta: "Aprenda um pouco mais como as engrenagens funcionam", perguntas: perguntas, bgColor: UIColor(red: 145/255, green: 101/255, blue: 228/255, alpha: 1), indice: 10))
        
        licoes.append(LicaoPergunta(nome: "Rendimentos", descricaoCurta: "Descubra como rendem seus investimentos", perguntas: perguntas, bgColor: UIColor(red: 145/255, green: 101/255, blue: 228/255, alpha: 1), indice: 11))
        
        desc = "Educação financeira na prática"
        let cat4 = Categoria(nome: "Intermediário", imagemCollection: catsCols[3], imagemNavigation: catsHeaders[3], descricaoCurta: desc, licoes: licoes, dicaDoDia: false, indice: 12)
        
        categorias.append(cat4)
        
        return categorias
    }
    
}
