//
//  StructComics.swift
//  App-Marvel-Teste
//
//  Created by Yan Meneguelli on 26/03/19.
//  Copyright © 2019 Yannes Meneguelli. All rights reserved.
//

import UIKit


struct APIComics:Decodable {
    let code: Int
    let status: String
    let copyright: String
    let attributionText: String
    let attributionHTML: String
    let data: DataComicsApi
}


struct DataComicsApi:Decodable {
    let offset: Int
    let limit:  Int
    let total:  Int
    let count:  Int
    let results: [ResultsComicsAPi]
}

struct ResultsComicsAPi:Decodable {
    let id:Int
    let digitalId:Int
    let title:String
    let issueNumber:Double
    let variantDescription:String
    let description: String?
}

