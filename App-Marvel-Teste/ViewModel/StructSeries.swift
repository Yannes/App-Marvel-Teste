//
//  StructSeries.swift
//  App-Marvel-Teste
//
//  Created by Yan Meneguelli on 26/03/19.
//  Copyright © 2019 Yannes Meneguelli. All rights reserved.
//

import UIKit

struct APISeries:Decodable {
    let code: Int
    let status: String
    let copyright: String
    let attributionText: String
    let attributionHTML: String
    let data: DataSeriesApi
}

struct DataSeriesApi:Decodable {
    let offset: Int
    let limit:  Int
    let total:  Int
    let count:  Int
    let results: [ResultsSeriesAPi]
}

struct ResultsSeriesAPi:Decodable {
    let id:Int
    let title:String
    let description: String?
}
