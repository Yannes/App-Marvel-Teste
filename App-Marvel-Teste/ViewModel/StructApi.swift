//
//  StructApi.swift
//  App-Marvel-Teste
//
//  Created by Yan Meneguelli on 25/03/19.
//  Copyright © 2019 Yannes Meneguelli. All rights reserved.
//

import UIKit

struct MarvelApi:Decodable {
    let code: Int
    let status: String
    let copyright: String
    let attributionText: String
    let attributionHTML: String
    let data: DataComics
}


struct DataComics:Decodable {
    let offset: Int
    let limit:  Int
    let total:  Int
    let count:  Int
    let results: [ResultsComics]
}

struct ResultsComics:Decodable {
    let id:Int
    let name:String
    let description:String
    let modified:String
    let resourceURI:String
    let urls: [UrlDescription]
    let thumbnail:ThumbnailDetail
}

struct UrlDescription:Decodable {
    let type: String
    let url:  String
}

struct ThumbnailDetail:Decodable {
    let path: String
    let `extension`:  String
}
