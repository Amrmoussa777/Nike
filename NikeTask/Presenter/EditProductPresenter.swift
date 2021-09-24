//
//  EditProductPresenter.swift
//  NikeTask
//
//  Created by Amr Moussa on 23/09/2021.
//



import UIKit

 protocol EditProductPresenterProtocol {
    
    var product:productModel?{get}
    func backPressed()
    func getImagePressed()
    func SaveProductPressed()
 }


class EditProductPresenter: EditProductPresenterProtocol {
    var product: productModel?
    
    weak  var view:EditProductVC?
    
    init(view:EditProductVC) {
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
    
    func newImageSelected(img: UIImage) {
        view?.getImageButton.setItemImage(img: img)
    }
    
    @objc func SaveProductPressed() {
        checkInputs() ? editInDB():showErrorMessage(text: Strings.fillInfo)
     }
    
     func laodProduct(){
        guard view != nil else {return}
        view?.getImageButton.setItemImage(img: product?.image)
        view?.nameTF.text = product?.name
        view?.priceTF.text = String(product?.price ?? 0)
        view?.descTF.text = product?.desc
    }
    
    private func checkInputs()-> Bool{
        let isValid:Bool = !(view?.nameTF.text?.isEmpty ?? true)  && !(view?.descTF.text?.isEmpty ?? true) && (view?.getImageButton.backgroundImage(for: .normal) != nil)
        return isValid
    }
    
    private func editInDB(){
        guard let product = product else {
            return
        }
        let name = view?.nameTF.text ?? ""
        let desc = view?.descTF.text ?? ""
        let price = Int(view?.priceTF.text ?? "") ?? 0
        let image  = view?.getImageButton.backgroundImage(for: .normal) ?? Images.logoImage!
        let newProduct = productModel(id: product.id , name: name, image: image, price: price, desc: desc)
        
        let loadignVeiw = view?.view.showLoadingView()
        DataManager.shared.editProductInDB(newProduct: newProduct) {[weak self] res in
            guard let self = self else {return}
            loadignVeiw?.removeFromSuperview()
            switch(res){
            case .failure(let err):
                self.showErrorMessage(text: err.rawValue)
            case .success(_):
                self.updateHome()
            }
        }
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
