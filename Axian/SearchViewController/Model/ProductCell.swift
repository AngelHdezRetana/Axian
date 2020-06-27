//
//  ProductCell.swift
//  Axian
//
//  Created by Admin on 6/27/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelLocation: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var imageProduct: UIImageView!
    
    override func prepareForReuse() {
        imageProduct.image = UIImage(named: "bag")
    }
    
}
