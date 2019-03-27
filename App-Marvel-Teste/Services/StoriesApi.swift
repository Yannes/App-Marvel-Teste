//
//  StoriesApi.swift
//  App-Marvel-Teste
//
//  Created by Yan Meneguelli on 27/03/19.
//  Copyright © 2019 Yannes Meneguelli. All rights reserved.
//

import UIKit
import CryptoSwift


class StoriesApi: NSObject {
    
    let publicKey  = "6d0586440891a03b22bdad697752fb2f"
    let privateKey = "e0215c13b509a960ac2ec6a7e4beff46c0067049"
    let ts         = NSDate().timeIntervalSince1970.description
    
    
    
    func StoriesCallApi(id:Int,completion: @escaping(_ Sucesso: APIStories) ->()){

        let hash = "\(ts)\(privateKey)\(publicKey)".md5()
        let urlString = "https://gateway.marvel.com:443/v1/public/characters/\(id)/stories?apikey=\(publicKey)&ts=\(ts)&hash=\(hash)"
        
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            guard let data = data else{return}
            do {
                let gitResponse = try JSONDecoder().decode(APIStories.self, from: data)
                completion(gitResponse)
            } catch let jsonError{
                print(jsonError)
            }
            }.resume()
    }
    
    
    
    
}
