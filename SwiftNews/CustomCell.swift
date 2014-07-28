//
//  CustomCell.swift
//  SwiftNews
//
//  Created by PxP_ss on 2014/07/26.
//  Copyright (c) 2014年 A.Akira. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var imageOfCell: UIImageView!
    @IBOutlet weak var stock: UILabel!
    
    // セル内セット
    func configureCell(image:NSString, title:NSString, stock:NSString){
        self.title.text = title.description
        self.stock.text = stock.description
        self.imageOfCell.image = UIImage(named:image)

    }
}
