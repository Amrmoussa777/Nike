//
//  NTVectorImageView.swift
//  NikeTask
//
//  Created by Amr Moussa on 24/09/2021.
//

import Foundation

import UIKit

class NTVectorImageView: UIImageView {
    let ImgPlaceHolder = Images.avatarPlaceholder
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureImageView(newTintColor:.black)
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureImageView(newTintColor:UIColor){
        layer.cornerRadius = 10
        clipsToBounds = true
        contentMode = .scaleAspectFill
        tintColor = .black
        backgroundColor = .systemBackground
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setImage(img:UIImage?){
        DispatchQueue.main.async {
            self.image = img
        }
        
    }
}
