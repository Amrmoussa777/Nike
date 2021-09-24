//
//  DetaieldViewPresenter.swift
//  NikeTask
//
//  Created by Amr Moussa on 23/09/2021.
//

import UIKit


protocol DetailedViewPresenterProtocol {
    var product:productModel?{ get }
    func editClicked()
    func deletedPressed()
}


class DetaieldViewPresenter: DetailedViewPresenterProtocol {
    var product: productModel?{didSet{setDate()}}
    
    
    
    
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
        guard let dProduct = product else {return}
        let loadingView = view?.showLoadingView()
        DataManager.shared.deleteProduct(dProduct: dProduct) { [weak self] result in
            guard let self = self else {return}
            loadingView?.removeFromSuperview()
            switch(result){
            case .success(_):
                self.updateHome()
            case .failure( let error):
                self.showErrorMessage(text: error.rawValue)
            }
        }
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
    
    private func showErrorMessage(text:String){
        view?.showToast(message: text,font: UIFont.systemFont(ofSize: 14), icon: Images.error)
    }
    private func updateHome(){
        weak var parent = view?.presentingViewController as? ProductsVC
        view?.dismiss(animated: true, completion: {
            parent?.productsPresenter.loadData()
        })
    }
    
}
