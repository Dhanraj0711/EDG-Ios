//
//  ProductCell.swift
//  EDGiOSTest
//
//  Created by on 03/06/23.
//

import UIKit

class ProductCell: UITableViewCell {

    @IBOutlet var vwOuter: UIView!
    @IBOutlet var img: UIImageView!
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblPrice: UILabel!
    @IBOutlet var btnAddToCart: UIButton!
    
    @IBOutlet var btnFav: UIControl!
    @IBOutlet var imgFav: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        vwOuter.odlesCommonShadow(opacity: 1, radius: 8, color: UIColor(red: 0, green: 0, blue: 0, alpha: 0.1), offset: CGSize(width: 0, height: 0))
        vwOuter.layer.cornerRadius = 6
        
        btnFav.odlesCommonShadow(opacity: 1, radius: 8, color: UIColor(red: 0, green: 0, blue: 0, alpha: 0.1), offset: CGSize(width: 0, height: 0))
        btnFav.layer.cornerRadius = btnFav.frame.size.height/2
        
        btnAddToCart.layer.cornerRadius = 4
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
