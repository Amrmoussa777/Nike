//
//  NTImageView.swift
//  NikeTask
//
//  Created by Amr Moussa on 22/09/2021.
//

import UIKit

class NTImageView: UIImageView {
    let ImgPlaceHolder = Images.avatarPlaceholder
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureImageView(newTintColor:.black)
    }
    
    init(frame: CGRect,tintColor:UIColor = .black) {
        super.init(frame: frame)
        configureImageView(newTintColor:tintColor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureImageView(newTintColor:UIColor){
        layer.cornerRadius = 10
        clipsToBounds = true
        image = ImgPlaceHolder
        contentMode = .scaleAspectFill
        tintColor = .black
        backgroundColor = .lowGray
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setImage(img:UIImage?){
        DispatchQueue.main.async {
            self.image = img
        }
        
    }
}
