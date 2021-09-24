//
//  FilterVCPresenter.swift
//  NikeTask
//
//  Created by Amr Moussa on 23/09/2021.
//

import Foundation



protocol FilterVCiewPresenterProtocol {
    #warning("<#T##message###>")
    func filterPressed()
    func resetPressed()
    func filterValueChanged(with value:Int)
}


class FilterVCPresenter: FilterVCiewPresenterProtocol {
   
    
    func filterValueChanged(with value: Int) {
        #warning("<#T##message###>")
    }
    
    
    
    weak  var view:FilterVC?
    
    init(view:FilterVC) {
        self.view = view
        
    }
    
    @objc func filterPressed() {
        let subName = view?.nameTF.text ?? ""
        let ratio = view?.slider.value ?? 0.5
        weak var parent = view?.presentingViewController as? ProductsVC
        view?.dismiss(animated: true, completion: {
            parent?.productsPresenter.filterData(with: subName, ratio: ratio)
        })

    }
    
    @objc  func resetPressed() {
        view?.nameTF.text = ""
        view?.slider.setValue(1, animated: true)
    }
    
    
    
}
