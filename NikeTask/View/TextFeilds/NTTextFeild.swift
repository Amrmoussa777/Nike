//
//  NTTextFeild.swift
//  NikeTask
//
//  Created by Amr Moussa on 23/09/2021.
//

import UIKit


class NTTextfeild: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    init(placeHolder:String) {
        super.init(frame: .zero)
        configureLyout(placholder:placeHolder)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLyout(placholder:String){
        self.placeholder = placholder
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addButtomLine()
    }
    
 
}

