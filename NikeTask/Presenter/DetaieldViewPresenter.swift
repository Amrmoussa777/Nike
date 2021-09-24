//
//  DetaieldViewPresenter.swift
//  NikeTask
//
//  Created by Amr Moussa on 23/09/2021.
//

import Foundation


protocol DetailedViewPresenterProtocol {
    var product:product?{ get }
    func editClicked()
    func deletedPressed()
}


class DetaieldViewPresenter: DetailedViewPresenterProtocol {
    var product: product?{didSet{setDate()}}
    
    
    
    
    weak  var view:DetaieldProduct?
    
    init(view:DetaieldProduct) {
        self.view = view
        
    }
    
    private func setDate(){
        view?.productImage.setImage(img: product?.image)
        view?.nameLabel.setText(text: product?.name ?? "")
        view?.priceLabel.setPrice(Price: String(product?.price ?? 0))
        view?.descLabel.setDesc(desc: product?.desc ?? "")
    }
    
    @objc func deletedPressed() {
        print(product)
    }
    
    @objc  func editClicked() {
        weak var parent = view?.presentingViewController
        view?.dismiss(animated: true, completion: {
            let editNewProduct = EditProductVC()
            editNewProduct.presenter.product = self.product
            editNewProduct.modalPresentationStyle = .fullScreen
            parent?.present(editNewProduct, animated: true, completion: nil)
        })
    }
    
    
    
}
