//
//  EditProductVC.swift
//  NikeTask
//
//  Created by Amr Moussa on 23/09/2021.
//

import UIKit


class EditProductVC: productModifyBase {
    
    lazy var presenter = EditProductPresenter(view: self)
        
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureButtonsActions()
        presenter.laodProduct()
    }
    
    private func configure(){
        titleLabel.setText(text: Strings.editTitle)
        addButton.setTitle(title: Strings.editButtonTitle, BGC: .primaryBlue)
    }
    
    private func configureButtonsActions(){
        backButton.addTarget(presenter, action: #selector(presenter.backPressed), for: .touchUpInside)
        getImageButton.addTarget(presenter, action: #selector(presenter.getImagePressed), for: .touchUpInside)
        addButton.addTarget(presenter, action: #selector(presenter.SaveProductPressed), for: .touchUpInside)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                presenter.newImageSelected(img: pickedImage)
            }
            dismiss(animated: true, completion: nil)
        }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            dismiss(animated: true, completion: nil)
        }
}


