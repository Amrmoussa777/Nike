//
//  NTButton.swift
//  NikeTask
//
//  Created by Amr Moussa on 22/09/2021.
//



import UIKit


class NTButton: UIButton {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     init(iconImage:UIImage?) {
           super.init(frame: .zero)
            backgroundColor   = .systemBackground
           configure(iconImage: iconImage)
       }
    
    
    private func configure(iconImage:UIImage?){
        let image = iconImage
        setImage(image, for: .normal)
        imageView?.contentMode = .scaleAspectFit
        imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        imageView?.tintColor = .headlineColor
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    
    
}

