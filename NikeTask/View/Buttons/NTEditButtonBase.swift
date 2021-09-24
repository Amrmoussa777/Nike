//
//  NTEditButtonBase.swift
//  NikeTask
//
//  Created by Amr Moussa on 23/09/2021.
//

import UIKit


class NTEditButtonBase: UIButton {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLyout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLyout(){
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    
   
    
}

