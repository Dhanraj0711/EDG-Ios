//
//  FavouriteVC.swift
//  EDGiOSTest
//
//  Created by on 03/06/23.
//

import UIKit

class FavouriteVC: UIViewController {

    @IBOutlet var tblList: UITableView!
    var shared : arrProductInstance = arrProductInstance.shared
    var arrFav = [Products]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        initVC()
    }
    func initVC() {
        self.navigationItem.title = "Favourites"
        tblList.register(UINib(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: "ProductCell")
        filterFavouriteProduct()
    }
    func filterFavouriteProduct() {
        arrFav = shared.products.filter { fav in
            return fav.isFav == true
        }
        tblList.reloadData()
    }
    @objc func fav_tapped(_ sender : UIButton) {
        for obj in shared.products {
            let id = obj.id
            if id == arrFav[sender.tag].id {
                obj.isFav = false
                break
            }
        }
        arrFav.remove(at: sender.tag)
        tblList.reloadData()
    }
    func openDetailVC(ind: Int) {
        for i in 0..<shared.products.count {
            let id = shared.products[i].id
            if id == arrFav[ind].id {
                let vc: ProductDetailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProductDetailVC") as! ProductDetailVC
                vc.objIndex = i
                self.navigationController?.pushViewController(vc, animated: true)
                break
            }
        }
    }
}

extension FavouriteVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrFav.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : ProductCell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductCell
        
        cell.btnFav.tag = indexPath.row
        cell.btnFav.addTarget(self, action: #selector(fav_tapped(_:)), for: .touchUpInside)
        
        cell.img.kf.indicatorType = .activity
        cell.img.kf.setImage(with: URL(string: arrFav[indexPath.row].imageURL ?? ""))
        
        cell.lblName.text = arrFav[indexPath.row].title ?? ""
        cell.lblPrice.text = "$" + "\(arrFav[indexPath.row].price?[0].value ?? 10)"
        
        if arrFav[indexPath.row].isFav == true {
            cell.imgFav.image = UIImage(systemName: "heart.fill")
        } else {
            cell.imgFav.image = UIImage(systemName: "heart")
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        openDetailVC(ind: indexPath.row)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
