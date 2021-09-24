//
//  AddProductButton.swift
//  NikeTask
//
//  Created by Amr Moussa on 23/09/2021.
//

import UIKit


class alterProductButton: NTEditButtonBase {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLyout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLyout(){
        titleLabel?.font = UIFont.systemFont(ofSize: 17,weight: .semibold)
       
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        roundShape()
    }
    func setTitle(title:String,BGC:UIColor,TextColor:UIColor = .white){
        backgroundColor = BGC
        setTitle(title, for: .normal)
        setTitleColor(TextColor, for: .normal)
    }
    
    
}

