//
//  ProductCell.swift
//  NikeTask
//
//  Created by Amr Moussa on 22/09/2021.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
     static let cellID = "productCEll"
    let productImage = NTImageView(frame: .zero)
    let nameLabel = NTLabel()
    let priceLabel = PriceLabel()
    let descLabel = DescLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureLayout(){
        addSubViews(productImage,nameLabel,
                    priceLabel,descLabel)
        let padding:CGFloat = 10
        NSLayoutConstraint.activate([
            productImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            productImage.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            productImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            productImage.heightAnchor.constraint(equalTo: heightAnchor,multiplier: 0.6),
            
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            nameLabel.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: padding),
            nameLabel.heightAnchor.constraint(equalToConstant: 15),
            nameLabel.widthAnchor.constraint(equalTo: widthAnchor,multiplier: 0.6),
            
            priceLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            priceLabel.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: padding),
            priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -padding),
            priceLabel.heightAnchor.constraint(equalToConstant: 17),
            
            
            descLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            descLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            descLabel.bottomAnchor.constraint(equalTo: bottomAnchor ,constant:  -padding),
            descLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
        ])
        backgroundColor = .systemBackground
        
    }
    
    
    func setProduct(product:productModel){
        productImage.setImage(img: product.image)
        nameLabel.setText(text: product.name)
        priceLabel.setPrice(Price: String(product.price))
        descLabel.setDesc(desc: product.desc)
    }
    
}
