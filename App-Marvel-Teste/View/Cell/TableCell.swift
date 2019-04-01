//
//  TableCell.swift
//  App-Marvel-Teste
//
//  Created by Macintosh HD on 3/28/19.
//  Copyright © 2019 Yannes Meneguelli. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {
    
    class var identifier: String {
        return String(describing: self)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepare()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepare()
    }
    
    func prepare() { }
}
