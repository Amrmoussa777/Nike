//
//  DetaieldProduct.swift
//  NikeTask
//
//  Created by Amr Moussa on 23/09/2021.
//

import UIKit

class DetaieldProduct: UIViewController {
    
    lazy var  detailedPresenter =  DetaieldViewPresenter(view: self)
    let contentView = UIView()
    
    let productImage = NTImageView(frame: .zero)
    let nameLabel = NTLabel()
    let priceLabel = PriceLabel()
    let descLabel = DescLabel()
    
    let editButton = alterProductButton()
    let deleteButton = alterProductButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        configureDissmis()
        configureButtons()
        // Do any additional setup after loading the view.
    }
    
    private func configureLayout(){
          

           view.backgroundColor = .clear
           contentView.translatesAutoresizingMaskIntoConstraints = false
           contentView.backgroundColor = .systemBackground
           contentView.RoundCorners(radius: 30)
           view.addSubview(contentView)
            
           let viewHeight = view.frame.size.height
           let padding:CGFloat = 20
           NSLayoutConstraint.activate([
               contentView.topAnchor.constraint(equalTo: view.topAnchor,constant: viewHeight/2),
               contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
               contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
               contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
           ])
           
           
           
           contentView.addSubViews(productImage,nameLabel,priceLabel,
                                   descLabel,editButton,deleteButton)
           
           NSLayoutConstraint.activate([
            productImage.topAnchor.constraint(equalTo: contentView.topAnchor,constant: padding/2),
            productImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: padding),
            productImage.widthAnchor.constraint(equalTo: contentView.widthAnchor,multiplier: 0.5),
            productImage.heightAnchor.constraint(equalToConstant: 130),
               
            nameLabel.topAnchor.constraint(equalTo: productImage.bottomAnchor,constant: padding),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: padding),
            nameLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor,multiplier: 0.6),
            nameLabel.heightAnchor.constraint(equalToConstant: 25),
            
            priceLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            priceLabel.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: padding),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -padding),
            priceLabel.heightAnchor.constraint(equalToConstant: 23),
            
            
            descLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            descLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: padding),
            descLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -padding),
            descLabel.heightAnchor.constraint(equalToConstant: 40),
            
            
            
            deleteButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            deleteButton.heightAnchor.constraint(equalToConstant: 50),
            deleteButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
            deleteButton.widthAnchor.constraint(equalTo: contentView.widthAnchor,multiplier: 0.4),
            
            editButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            editButton.heightAnchor.constraint(equalToConstant: 50),
            editButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
            editButton.leadingAnchor.constraint(equalTo: deleteButton.trailingAnchor,constant: padding),

               
           ])
        
        editButton.setTitle(title: "Edit Product", BGC: .primaryBlue)
        deleteButton.setTitle(title: "Delete", BGC: .systemBackground, TextColor: .systemRed)
        nameLabel.setAsHeadline()
        priceLabel.font = UIFont.systemFont(ofSize: 20)
        descLabel.setFontSize(size: 15)
           
       }
    
    private func configureButtons(){
        editButton.addTarget(detailedPresenter, action: #selector(detailedPresenter.editClicked), for: .touchUpInside)
        deleteButton.addTarget(detailedPresenter, action: #selector(detailedPresenter.deletedPressed), for: .touchUpInside)
    }
   

}

extension DetaieldProduct:UIGestureRecognizerDelegate{
    
    private func configureDissmis(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(dissmisVC))
        tap.delegate = self
        view.addGestureRecognizer(tap)
    }
    //AVoid dissmissing when tapping on   content view
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return touch.view == gestureRecognizer.view
    }
}
