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
        view?.showToast(message: "filter tapped")
    }
    
    @objc  func resetPressed() {
        #warning("<#T##message###>")
    }
    
    
    
}
