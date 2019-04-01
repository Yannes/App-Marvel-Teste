//
//  CharacterLoadingCell.swift
//  App-Marvel-Teste
//
//  Created by Macintosh HD on 3/28/19.
//  Copyright © 2019 Yannes Meneguelli. All rights reserved.
//

import UIKit

class CharacterLoadingCell: TableCell {
    
    let indicatorView = UIActivityIndicatorView(style: .whiteLarge)

    override func prepare() {
        backgroundColor = #colorLiteral(red: 0.1490196078, green: 0.1490196078, blue: 0.1490196078, alpha: 1)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        indicatorView.color = #colorLiteral(red: 0.8795813918, green: 0.1668358743, blue: 0.1517194808, alpha: 1)
        indicatorView.center = contentView.center
        indicatorView.startAnimating()
        contentView.addSubview(indicatorView)
        indicatorView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        indicatorView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
}
