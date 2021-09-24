//
//  ProductsHeaderView.swift
//  NikeTask
//
//  Created by Amr Moussa on 22/09/2021.
//


import UIKit

class ProductsHeaderView: UICollectionReusableView {
    static let headerID = "headerID"
    let titleHeader = ProdctTitleView()
    let brandCardView = BrandCardView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLyout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLyout(){
        addSubViews(titleHeader,brandCardView)
        NSLayoutConstraint.activate([
            titleHeader.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .padding),
            titleHeader.topAnchor.constraint(equalTo: topAnchor, constant: .padding),
            titleHeader.trailingAnchor.constraint(equalTo: trailingAnchor, constant: .nPadding),
            titleHeader.heightAnchor.constraint(equalToConstant: 50),
            
            brandCardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .padding),
            brandCardView.topAnchor.constraint(equalTo: titleHeader.bottomAnchor, constant: .padding),
            brandCardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: .nPadding),
            brandCardView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])

        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    
}

