//
//  DescLabel.swift
//  NikeTask
//
//  Created by Amr Moussa on 22/09/2021.
//

import UIKit

class DescLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(Size:CGFloat,color:UIColor) {
        super.init(frame: .zero)
        font = UIFont.systemFont(ofSize: Size)
        textColor = color
    }
    
    private func configure(){
        font = UIFont.systemFont(ofSize: 12,weight: .thin)
        textColor = .secondaryLabel
        numberOfLines = 0 
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setFontSize(size:CGFloat){
        font = UIFont.systemFont(ofSize: size,weight: .thin)
    }
    func setDesc(desc:String){
       DispatchQueue.main.async {
           self.text =  desc
       }
      
   }
    func setAtrributtedText(attText:NSAttributedString){
        
        DispatchQueue.main.async {
            self.attributedText = attText
        }
    }
}
