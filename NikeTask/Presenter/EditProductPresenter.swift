//
//  EditProductPresenter.swift
//  NikeTask
//
//  Created by Amr Moussa on 23/09/2021.
//



import Foundation

 protocol EditProductPresenterProtocol {
    
    var product:product?{get}
    func backPressed()
    func getImagePressed()
    func SaveProductPressed()
 }


class EditProductPresenter: EditProductPresenterProtocol {
    var product: product?
    
    weak  var view:EditProductVC?
    
    init(view:EditProductVC) {
        self.view = view
    }
    
   @objc func backPressed() {
    view?.dismiss(animated: true)
    }
    
    @objc func getImagePressed() {
        #warning("")
        print("im")
    }
    
    @objc func SaveProductPressed() {
        print("im")

     }
    
     func laodProduct(){
        guard view != nil else {return}
        view?.getImageButton.setItemImage(img: product?.image)
        view?.nameTF.text = product?.name
        view?.priceTF.text = String(product?.price ?? 0)
        view?.descTF.text = product?.desc
    }
    
    
}
