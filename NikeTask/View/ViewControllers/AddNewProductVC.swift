//
//  AddNewProductVC.swift
//  NikeTask
//
//  Created by Amr Moussa on 23/09/2021.
//

import UIKit


class AddNewProductVC: productModifyBase {
    
    lazy var presenter = AddNewProductPresenter(view: self)
        
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureButtonsActions()
    }
    
    private func configure(){
        titleLabel.setText(text: Strings.addNewTitle)
        addButton.setTitle(title: Strings.addButtonTitle, BGC: .primaryBlue)
    }
    
    private func configureButtonsActions(){
        backButton.addTarget(presenter, action: #selector(presenter.backPressed), for: .touchUpInside)
        getImageButton.addTarget(presenter, action: #selector(presenter.getImagePressed), for: .touchUpInside)
        addButton.addTarget(presenter, action: #selector(presenter.addProductPressed), for: .touchUpInside)
    }
    
}

