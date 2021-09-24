//
//  ProductsPresenter.swift
//  NikeTask
//
//  Created by Amr Moussa on 22/09/2021.
//

import UIKit


 protocol ProductsPresenterProtocol {
    var data: [product] { get }
    func addProductPressed()
    func filterPressed()
    func loadData()
    func  viewEmptyState()
}

class ProductsPresenter:ProductsPresenterProtocol{
    var data: [product]  = []
    
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
        let filterVC = FilterVC()
        view?.present(filterVC, animated: true)
    }
    
    func productSelected(at row:Int){
        let product = data[row]
        let detaieldVC = DetaieldProduct()
        detaieldVC.detailedPresenter.product = product
        view?.present(detaieldVC, animated: true)
    }
    
     func loadData(){
        
    }
    
    func viewEmptyState(){
        view?.showEMptyState()
    }
    
    
    
}
