//
//  ProductNameLabel.swift
//  NikeTask
//
//  Created by Amr Moussa on 22/09/2021.
//

import UIKit


class NTLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(){
        text = "Product name"
        textColor = .headlineColor
        numberOfLines = 1
        font = UIFont.systemFont(ofSize: 15, weight: .bold)
        contentMode = .scaleAspectFit
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setAsHeadline(){
        textColor = .label
        font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }
    
    func setAsEmptyStateHeadLine(){
        textColor = .headlineColor
        font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        textAlignment = .center
    }
    
    func setAsTitleLabel(){
        textColor = .label
        font = UIFont.systemFont(ofSize: 23, weight: .bold)
        textAlignment = .center
    }
    
    func setText(text:String){
        DispatchQueue.main.async {
            self.text = text
        }
        
    }
    
   
}
