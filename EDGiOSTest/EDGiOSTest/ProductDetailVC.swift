//
//  ProductDetailVC.swift
//  EDGiOSTest
//
//  Created by on 03/06/23.
//

import UIKit

class ProductDetailVC: UIViewController {

    var objIndex = 0
    @IBOutlet var img: UIImageView!
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblPrice: UILabel!
    @IBOutlet var btnFav: UIControl!
    @IBOutlet var imgFav: UIImageView!
    var shared : arrProductInstance = arrProductInstance.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        initVC()
    }
    func initVC() {
        self.navigationItem.title = "Product Detail"
        btnFav.odlesCommonShadow(opacity: 1, radius: 8, color: UIColor(red: 0, green: 0, blue: 0, alpha: 0.1), offset: CGSize(width: 0, height: 0))
        btnFav.layer.cornerRadius = btnFav.frame.size.height/2
        dataLoading()
    }
    @IBAction func fav_tapped(_ sender : UIControl) {
        if shared.products[objIndex].isFav == true {
            imgFav.image = UIImage(systemName: "heart")
            shared.products[objIndex].isFav = false
        } else {
            imgFav.image = UIImage(systemName: "heart.fill")
            shared.products[objIndex].isFav = true
        }
    }
    func dataLoading(){
        img.kf.indicatorType = .activity
        img.kf.setImage(with: URL(string: shared.products[objIndex].imageURL ?? ""))
        
        lblName.text = shared.products[objIndex].title ?? ""
        lblPrice.text = "$" + "\(shared.products[objIndex].price?[0].value ?? 10)"
        
        if shared.products[objIndex].isFav == true {
            imgFav.image = UIImage(systemName: "heart.fill")
        } else {
            imgFav.image = UIImage(systemName: "heart")
        }
    }

}
