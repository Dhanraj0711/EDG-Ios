//
//  ProductListVC.swift
//  EDGiOSTest
//
//  Created by on 03/06/23.
//

import UIKit
import Kingfisher

class ProductListVC: UIViewController {

    @IBOutlet var tblList: UITableView!
    var shared : arrProductInstance = arrProductInstance.shared

    //MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        initVC()
    }
    override func viewWillAppear(_ animated: Bool) {
        if shared.products.count != 0 {
            tblList.reloadData()
        }
    }
    func initVC() {
        self.navigationItem.title = "Product List"
        tblList.register(UINib(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: "ProductCell")
        getProductList()
    }

    @objc func fav_tapped(_ sender : UIButton) {
        let position : CGPoint = sender.convert(sender.bounds.origin, to: self.tblList)
        let indexPath = self.tblList.indexPathForRow(at: position)
        let cell = tblList.cellForRow(at: indexPath!) as! ProductCell
        
        if shared.products[sender.tag].isFav == true {
            cell.imgFav.image = UIImage(systemName: "heart")
            shared.products[sender.tag].isFav = false
        } else {
            cell.imgFav.image = UIImage(systemName: "heart.fill")
            shared.products[sender.tag].isFav = true
        }
    }
    
    //MARK: - API Call
    func getProductList() {
        AFWrapper.getProductList(success: { response in
            self.shared.products = response.products ?? []
            self.tblList.reloadData()
        }) { error in
            print("error:-->", error.localizedDescription)
        }
    }
    
}

extension ProductListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shared.products.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : ProductCell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductCell
        
        cell.btnFav.tag = indexPath.row
        cell.btnFav.addTarget(self, action: #selector(fav_tapped(_:)), for: .touchUpInside)
        
        cell.img.kf.indicatorType = .activity
        cell.img.kf.setImage(with: URL(string: shared.products[indexPath.row].imageURL ?? ""))
        
        cell.lblName.text = shared.products[indexPath.row].title ?? ""
        cell.lblPrice.text = "$" + "\(shared.products[indexPath.row].price?[0].value ?? 10)"
        
        if shared.products[indexPath.row].isFav == true {
            cell.imgFav.image = UIImage(systemName: "heart.fill")
        } else {
            cell.imgFav.image = UIImage(systemName: "heart")
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc: ProductDetailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProductDetailVC") as! ProductDetailVC
        vc.objIndex = indexPath.row
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
