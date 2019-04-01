//
//  Filter.swift
//  App-Marvel-Teste
//
//  Created by Yan Meneguelli on 27/03/19.
//  Copyright © 2019 Yannes Meneguelli. All rights reserved.
//

import UIKit



var comics: [ResultsComics] = []
class Filter: NSObject {

    func filtraCharacter(listaDeCharacter:Array<ResultsComics>, texto:String) -> Array<ResultsComics>{
        
        let CharacterEncontrados = listaDeCharacter.filter { (ResultsComics) -> Bool in
            let nomeCharacter = ResultsComics.name
            return (nomeCharacter).contains(texto)
        }
        return CharacterEncontrados
    }

}
