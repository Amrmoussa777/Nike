//
//  AddNewProductPresenter.swift
//  NikeTask
//
//  Created by Amr Moussa on 23/09/2021.
//

import Foundation

protocol AddNewProductPresenterProtocol {
   func backPressed()
   func getImagePressed()
    func addProductPressed()
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
        #warning("")
        print("im")
    }
    
    @objc func addProductPressed() {
        #warning("")
        print("imbutt")
    }
    
    
}
