//
//  BrandCardView.swift
//  NikeTask
//
//  Created by Amr Moussa on 22/09/2021.
//


import UIKit


class BrandCardView: UIView {
    let logoImage = NTImageView(frame: .zero)
    let brandlabel = NTLabel()
    let brandDesc = DescLabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLyout()
        setData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLyout(){
        backgroundColor = .lowGray
        RoundCorners()
        translatesAutoresizingMaskIntoConstraints = false
        addSubViews(logoImage,brandlabel,brandDesc)
        let padding:CGFloat = 20
        NSLayoutConstraint.activate([
            logoImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            logoImage.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            logoImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding),
            logoImage.widthAnchor.constraint(equalTo: logoImage.heightAnchor),
            
            brandlabel.leadingAnchor.constraint(equalTo: logoImage.trailingAnchor, constant: .padding),
            brandlabel.topAnchor.constraint(equalTo: logoImage.topAnchor,constant: .padding),
            brandlabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: .nPadding),
            brandlabel.heightAnchor.constraint(equalToConstant: 20),
            
            brandDesc.leadingAnchor.constraint(equalTo: logoImage.trailingAnchor, constant: .padding),
            brandDesc.topAnchor.constraint(equalTo: brandlabel.bottomAnchor,constant: .padding),
            brandDesc.trailingAnchor.constraint(equalTo: trailingAnchor, constant: .nPadding),
            brandDesc.heightAnchor.constraint(equalToConstant: 40),
        ])
        brandlabel.setAsHeadline()
    }
    
    
    private func setData(){
        logoImage.setImage(img: Images.logoImage)
        brandlabel.setText(text: "Nike")
        brandDesc.setAtrributtedText(attText: getBrandDecc())
    }
    
    private func getBrandDecc()->NSAttributedString{
        let fullString = NSMutableAttributedString(string: "Nike-Support@Mail.Com \n")

        let imgAttachment = NSTextAttachment()
        imgAttachment.image = UIImage(named:"locIcon")
        
        // for adding spacing
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5
        fullString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, fullString.length))

        
        let image1String = NSAttributedString(attachment: imgAttachment)

        fullString.append(image1String)
        fullString.append(NSAttributedString(string: " Level 4 - City Mall"))

        return fullString
    
    }
    
}

