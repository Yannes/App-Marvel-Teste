//
//  StructEvents.swift
//  App-Marvel-Teste
//
//  Created by Yan Meneguelli on 26/03/19.
//  Copyright © 2019 Yannes Meneguelli. All rights reserved.
//

import UIKit

struct APIEvents:Decodable {
    let code: Int
    let status: String
    let copyright: String
    let attributionText: String
    let attributionHTML: String
    let data: DataEventsApi
}


struct DataEventsApi:Decodable {
    let offset: Int
    let limit:  Int
    let total:  Int
    let count:  Int
    let results: [ResultsEventsAPi]
}

struct ResultsEventsAPi:Decodable {
    let id:Int
    let title:String
    let description: String?
}

