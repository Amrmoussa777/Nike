//
//  GetImageButton.swift
//  NikeTask
//
//  Created by Amr Moussa on 23/09/2021.
//

//
//  GetImageButton.swift
//  NikeTask
//
//  Created by Amr Moussa on 22/09/2021.
//

import UIKit


class GetImageButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        configureLayers()
        RoundCorners()
    }
    
    private func configureLayers(){
        let shadow = UIColor.black.withAlphaComponent(0.2).cgColor

        let bottomImageGradient = CAGradientLayer()
        bottomImageGradient.frame = bounds
        
        bottomImageGradient.startPoint = CGPoint(x: 0.5, y: 1.0)
        bottomImageGradient.endPoint = CGPoint(x: 0.5, y: 0.0)
        bottomImageGradient.colors = [shadow,UIColor.clear.cgColor]
        layer.insertSublayer(bottomImageGradient, at: 0)
                
    }
    
    
    
    func setItemImage(img:UIImage?){
        imageView?.tintColor = .headlineColor
        setImage(Images.editIcon, for: .normal)

        imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom:-frame.height/2, right: 0)
        setBackgroundImage(img, for: .normal)
        imageView?.contentMode = .scaleAspectFit
    }
    
    
}


