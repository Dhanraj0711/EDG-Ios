//
//  AFWrapper.swift
//  EDGiOSTest
//
//  Created by on 03/06/23.
//

import Foundation
import Alamofire
import ObjectMapper
import UIKit


class AFWrapper: NSObject  {
    
    class func getProductList(success:@escaping (ProductListModel) -> Void, failure:@escaping (Error) -> Void) {
        SceneDelegate.sharedInstanceSD().showBlurLoaderOdles()
        AF.request(Constant.edg_api.product_api, method: .get).response {
            (response) -> Void in
            switch response.result {
            case .success(let data):
                do {
                    SceneDelegate.sharedInstanceSD().removeBluerLoaderOdles()
                    let asJSON = try JSONSerialization.jsonObject(with: data!)
                    guard let castingValue = asJSON as? [String: Any] else { return }
                    guard let userData = Mapper<ProductListModel>().map(JSON: castingValue) else { return }
                    success(userData)
                } catch {
                    SceneDelegate.sharedInstanceSD().removeBluerLoaderOdles()
                    failure(error)
                    print("Error decoding response: \(error.localizedDescription)")
                }
            case .failure(let error):
                SceneDelegate.sharedInstanceSD().removeBluerLoaderOdles()
                print("failure---",error.localizedDescription)
            }
        }
    }
    
}
