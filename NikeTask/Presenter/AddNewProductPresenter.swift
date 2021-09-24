//
//  AddNewProductPresenter.swift
//  NikeTask
//
//  Created by Amr Moussa on 23/09/2021.
//

import UIKit

protocol AddNewProductPresenterProtocol {
   func backPressed()
   func getImagePressed()
    func addProductPressed()
    func newImageSelected(img:UIImage)
}


class AddNewProductPresenter: AddNewProductPresenterProtocol {
   
    
    
    weak  var view:AddNewProductVC?
    
    init(view:AddNewProductVC) {
        self.view = view
        
    }
    
   @objc func backPressed() {
    view?.dismiss(animated: true)
    }
    
    @objc func getImagePressed() {
        guard let view =  view else {
            return
        }
        view.imagePicker.allowsEditing = false
        view.imagePicker.sourceType = .photoLibrary
        view.present(view.imagePicker , animated: true, completion: nil)
    }
    
    @objc func addProductPressed() {
        checkInputs() ? addToDB():showErrorMessage(text: Strings.fillInfo)
    }
    
    func newImageSelected(img: UIImage) {
        view?.getImageButton.setItemImage(img: img)
    }
    
    private func checkInputs()-> Bool{
        let isValid:Bool = !(view?.nameTF.text?.isEmpty ?? true)  && !(view?.descTF.text?.isEmpty ?? true) && (view?.getImageButton.backgroundImage(for: .normal) != nil)
        return isValid
    }
    
    private func addToDB(){
        let name = view?.nameTF.text ?? ""
        let desc = view?.descTF.text ?? ""
        let price = Int(view?.priceTF.text ?? "") ?? 0
        let image  = view?.getImageButton.backgroundImage(for: .normal) ?? Images.logoImage!
        let product = productModel(id: UUID.init(), name: name, image: image, price: price, desc: desc)
        
        let loadignVeiw = view?.view.showLoadingView()
        DataManager.shared.addNewProduct(newProduct: product) { [weak self] result in
            guard let self = self else {return}
            loadignVeiw?.removeFromSuperview()
            switch(result){
            case .success(_):
                self.updateHome()
            case .failure( let error):
                self.showErrorMessage(text: error.rawValue)
            }
        }
    }
    
    private func showErrorMessage(text:String){
        view?.showToast(message: text,font: UIFont.systemFont(ofSize: 14), icon: Images.error)
    }
    private func updateHome(){
        weak var parent = view?.presentingViewController as? ProductsVC
        view?.dismiss(animated: true, completion: {
            parent?.productsPresenter.newProductAdded()
        })
    }
}



