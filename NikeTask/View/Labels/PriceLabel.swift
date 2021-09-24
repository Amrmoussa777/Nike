//
//  PriceLabel.swift
//  NikeTask
//
//  Created by Amr Moussa on 22/09/2021.
//

import UIKit


class PriceLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure(){
        font = UIFont.systemFont(ofSize: 15,weight: .thin)
        textAlignment = .right
        textColor = .priceColor
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setPrice(Price:String){
       DispatchQueue.main.async {
           self.text =  "$" + Price
       }
      
   }

}
