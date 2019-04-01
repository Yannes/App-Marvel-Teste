//
//  CharacterCell.swift
//  App-Marvel-Teste
//
//  Created by Macintosh HD on 3/28/19.
//  Copyright © 2019 Yannes Meneguelli. All rights reserved.
//

import UIKit

class CharacterCell: TableCell {
    
    var model: ResultsComics? {
        didSet {
            if let model = model {
                updateView(model)
            }
        }
    }
    
    override func prepare() {
        backgroundColor = #colorLiteral(red: 0.1490196078, green: 0.1490196078, blue: 0.1490196078, alpha: 1)
        textLabel?.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        detailTextLabel?.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        textLabel?.numberOfLines = 0
        textLabel?.font =  UIFont.boldSystemFont(ofSize: 20.0)
        imageView?.image = UIImage(named: "Marvel-Black")
    
        
        let starButton = UIButton(type: .custom)
        starButton.setImage(#imageLiteral(resourceName: "favorite2"), for: .normal)
        starButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        starButton.tintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        starButton.addTarget(self, action: #selector(handleButtonFavorite(sender:)), for: .touchUpInside)
        accessoryView = starButton
    }
    
    @objc func handleButtonFavorite(sender: UIButton){
        if sender.isSelected {
            sender.setImage(#imageLiteral(resourceName: "favorite2"), for: .normal)
            sender.tintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            sender.isSelected = false
        } else {
            sender.setImage(#imageLiteral(resourceName: "favorite"), for: .normal)
            sender.tintColor = #colorLiteral(red: 0.9764705896, green: 0.9138895617, blue: 0, alpha: 1)
            sender.isSelected = true
        }
    }
    
    private func updateView(_ model: ResultsComics) {
        textLabel?.text  = model.name
        let url = "\(model.thumbnail.path).\(model.thumbnail.extension)"
        imageView?.download(from: url)
    }
}
