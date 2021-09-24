//
//  productModifyBase.swift
//  NikeTask
//
//  Created by Amr Moussa on 23/09/2021.
//

import UIKit

class productModifyBase: UIViewController {
    
    
    let backButton  = NTButton(iconImage: Images.backIcon)
    let titleLabel = NTLabel()
    
    let getImageButton = GetImageButton()
    
    let nameTF = NTTextfeild(placeHolder: Strings.namePlaceHolder)
    let descTF = NTTextfeild(placeHolder: Strings.DescPlaceHolder)
    let priceTF = NTTextfeild(placeHolder: Strings.pricePlaceHolder)
    let dollarImgV =  NTImageView(frame: .zero)
    
    let addButton = alterProductButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        
        // Do any additional setup after loading the view.
    }
    
    
     func configureLayout(){
        view.addSubViews(backButton,titleLabel,getImageButton,
                         nameTF,descTF,priceTF ,addButton,dollarImgV)
        
        let padding:CGFloat = 40
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: padding),
            titleLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor,constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            
            backButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor,constant: padding/2),
            backButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            backButton.heightAnchor.constraint(equalTo: titleLabel.heightAnchor),
            backButton.widthAnchor.constraint(equalTo: backButton.heightAnchor),
            
            getImageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            getImageButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            getImageButton.widthAnchor.constraint(equalTo: safeArea.widthAnchor,multiplier: 0.3),
            getImageButton.heightAnchor.constraint(equalTo: getImageButton.widthAnchor),
            
            nameTF.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: padding),
            nameTF.topAnchor.constraint(equalTo: getImageButton.bottomAnchor, constant: padding),
            nameTF.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor,constant: -padding),
            nameTF.heightAnchor.constraint(equalToConstant: 40),
            
            descTF.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: padding),
            descTF.topAnchor.constraint(equalTo: nameTF.bottomAnchor, constant: padding),
            descTF.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor,constant: -padding),
            descTF.heightAnchor.constraint(equalToConstant: 40),
            
            priceTF.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: padding),
            priceTF.topAnchor.constraint(equalTo: descTF.bottomAnchor, constant: padding),
            priceTF.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor,constant: -padding),
            priceTF.heightAnchor.constraint(equalToConstant: 40),
            
            dollarImgV.centerYAnchor.constraint(equalTo: priceTF.centerYAnchor),
            dollarImgV.trailingAnchor.constraint(equalTo: priceTF.trailingAnchor),
            dollarImgV.heightAnchor.constraint(equalToConstant: 15),
            dollarImgV.widthAnchor.constraint(equalToConstant: 15),

            
            addButton.topAnchor.constraint(equalTo: priceTF.bottomAnchor,constant: padding),
            addButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: padding),
            addButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor,constant: -padding),
            addButton.heightAnchor.constraint(equalToConstant: 50),
    
        ])
        
        titleLabel.setAsTitleLabel()
        priceTF.keyboardType = .phonePad
        
        dollarImgV.setImage(img: Images.dollarImage)
        dollarImgV.contentMode = .scaleAspectFit
        dollarImgV.backgroundColor = .systemBackground
        
        getImageButton.setItemImage(img: nil)
        view.backgroundColor = .systemBackground
        
        view.onTapDissmisKeyboard(VC: self)
        
    }
    
    #warning("send to presenter")
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
   
    

}
