//
//  ProductTitleView.swift
//  NikeTask
//
//  Created by Amr Moussa on 22/09/2021.
//



import UIKit

class ProdctTitleView: UIView {
    let filterButton = NTButton(iconImage: Images.filter)
    let addbtton = NTButton(iconImage: Images.addProductsIcon)
    let titleLabel = NTLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLyout()
        setData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLyout(){
        addSubViews(filterButton,addbtton,titleLabel)
        NSLayoutConstraint.activate([
            filterButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .padding),
            filterButton.topAnchor.constraint(equalTo: topAnchor, constant: .padding),
            filterButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: .nPadding ),
            filterButton.widthAnchor.constraint(equalTo: filterButton.heightAnchor),
            
            
            addbtton.topAnchor.constraint(equalTo: topAnchor, constant: .padding),
            addbtton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: .nPadding),
            addbtton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: .nPadding),
            addbtton.widthAnchor.constraint(equalTo: addbtton.heightAnchor),
            
            
            titleLabel.leadingAnchor.constraint(equalTo: filterButton.trailingAnchor, constant: .padding),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: .padding),
            titleLabel.trailingAnchor.constraint(equalTo: addbtton.leadingAnchor,constant: .nPadding),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: .nPadding),
            
        ])
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setData(){
        titleLabel.setAsTitleLabel()
        titleLabel.setText(text: "Store Products")
    }
    
}


