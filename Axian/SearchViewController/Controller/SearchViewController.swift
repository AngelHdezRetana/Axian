//
//  SearchViewController.swift
//  Axian
//
//  Created by Admin on 6/27/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
import Kingfisher

class SearchViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {
    
    var products: ProductStruct?
    var productList: [Record]? = []
    var productPage = 1
    let itemsPerPage = 10
    
    @IBOutlet weak var tableProduct: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
        let searchText:String = searchBar.text!
        let strPage = String(format: "%d", productPage)
        let strItemsPerPage = String(format: "%d", itemsPerPage)
        
        let api = API()
        api.setUrlParams(urlParams: [
            "force-plp": "true",
            "search-string": searchText,
            "page-number": strPage,
            "number-of-items-per-page": strItemsPerPage
        ])
        
        api.getProducts{(result) in
            switch result {
            case .success(let data):
                do {
                    self.products = try JSONDecoder().decode(ProductStruct.self, from: data)
                    self.productList = self.products?.plpResults?.records
                    
                    DispatchQueue.main.async {
                        self.tableProduct.reloadData()
                    }
                } catch {
                    
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell") as! ProductCell
        
        let product = productList![indexPath.row]
        cell.imageView!.kf.setImage(with: URL(string: product.smImage!))
        cell.labelTitle.text = product.productDisplayName
        cell.labelLocation.text = product.productType
        cell.labelPrice.text = String(format: "$%.02f", Float(product.listPrice!))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
}

