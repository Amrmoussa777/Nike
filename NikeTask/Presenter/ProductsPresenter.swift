//
//  ProductsPresenter.swift
//  NikeTask
//
//  Created by Amr Moussa on 22/09/2021.
//

import UIKit


 protocol ProductsPresenterProtocol {
    var data: [productModel] { get }
    var isFiltering:Bool {get}
    var filterdData:[productModel] { get }
    func addProductPressed()
    func filterPressed()
    func loadData()
    func  viewEmptyState()
}

class ProductsPresenter:ProductsPresenterProtocol{
    var data: [productModel]  = []
    var filterdData: [productModel] = []
    var isFiltering: Bool = false
    
    weak var view: ProductsVC?

    init(view:ProductsVC) {
        self.view = view
        data.isEmpty ? viewEmptyState():loadData()
    }
    
    
    @objc func addProductPressed() {
        let vc = AddNewProductVC()
        vc.modalPresentationStyle = .fullScreen
        view?.present(vc, animated: true)
    }
    
    @objc func filterPressed() {
        let filterVC = FilterVC.shared
        view?.present(filterVC, animated: true)
    }
    
    func productSelected(at row:Int){
        let product = isFiltering ? filterdData[row]:data[row]
        let detaieldVC = DetaieldProduct()
        detaieldVC.detailedPresenter.product = product
        view?.present(detaieldVC, animated: true)
    }
    
    func newProductAdded(){
        view?.showToast(message: Strings.added,font: UIFont.systemFont(ofSize: 15))
        loadData()
    }
    
     func loadData(){
        let loadingView = view?.showLoadingView()
        DataManager.shared.getProducts {[weak self] res in
            loadingView?.removeFromSuperview()
            guard let self = self else {return}
            switch(res){
            case .success(let products):
                guard !products.isEmpty else {break}
                self.data = products
                self.filterdData = products
                self.isFiltering = false
                self.view?.emptySate?.removeFromSuperview()
                self.view?.productsCV.reloadData()       
            case .failure(let error):
                self.view?.showToast(message: error.rawValue)
            }
        }
    }
    
    func viewEmptyState(){
        view?.showEMptyState()
    }
    
    func filterData(with name:String,ratio:Float){
        let nameFiteredProducts = namefilter(name: name)
        filterdData = priceFilter(ratio: ratio, Products: nameFiteredProducts)
        isFiltering = true
        view?.productsCV.reloadData()
    }
    
    
    func namefilter(name:String)->[productModel]{
        guard name != "" else {return data}
        let filterd = data.filter {$0.name.contains(name)}
        return filterd
    }
    
    func priceFilter(ratio:Float,Products:[productModel])->[productModel]{
        let minPrice = data.map{$0.price}.min() ?? 0
        let maxPrice = data.map{$0.price}.max() ?? 0
        let thresholdPrice = minPrice + Int((ratio * Float((maxPrice - minPrice))))
        return Products.filter{$0.price <= thresholdPrice}
    }
    
    
}
