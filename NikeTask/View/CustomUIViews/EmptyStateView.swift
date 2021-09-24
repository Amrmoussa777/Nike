//
//  EmptyStateView.swift
//  NikeTask
//
//  Created by Amr Moussa on 24/09/2021.
//



import UIKit


class EmptyStateView: UIView {
    
    let linesIMV = NTVectorImageView(frame: .zero)
    let boxIMV = NTVectorImageView(frame: .zero)
    let backGIMV = NTVectorImageView(frame: .zero)
    
    let headlineLabel  = NTLabel()
    let subHeadLaebl = DescLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLyout()
        setData()
        startAnimation()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLyout(){
        addSubViews(backGIMV,boxIMV,linesIMV,subHeadLaebl,headlineLabel)
        
        NSLayoutConstraint.activate([
            subHeadLaebl.centerYAnchor.constraint(equalTo: centerYAnchor),
            subHeadLaebl.centerXAnchor.constraint(equalTo: centerXAnchor),
            subHeadLaebl.widthAnchor.constraint(equalToConstant: 250),
            subHeadLaebl.heightAnchor.constraint(equalToConstant: 44),
            
            headlineLabel.bottomAnchor.constraint(equalTo: subHeadLaebl.topAnchor, constant: .nPadding),
            headlineLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            headlineLabel.widthAnchor.constraint(equalToConstant: 200),
            headlineLabel.heightAnchor.constraint(equalToConstant: 16),
            
            backGIMV.bottomAnchor.constraint(equalTo: headlineLabel.topAnchor, constant: .nPadding*2),
            backGIMV.centerXAnchor.constraint(equalTo: centerXAnchor),
            backGIMV.widthAnchor.constraint(equalToConstant: 164),
            backGIMV.heightAnchor.constraint(equalToConstant: 62),
            
            boxIMV.bottomAnchor.constraint(equalTo: headlineLabel.topAnchor, constant: -14),
            boxIMV.centerXAnchor.constraint(equalTo: centerXAnchor),
            boxIMV.widthAnchor.constraint(equalToConstant: 71),
            boxIMV.heightAnchor.constraint(equalToConstant: 52),
            
            linesIMV.bottomAnchor.constraint(equalTo: boxIMV.topAnchor, constant: -8),
            linesIMV.centerXAnchor.constraint(equalTo: centerXAnchor),
            linesIMV.widthAnchor.constraint(equalToConstant: 46),
            linesIMV.heightAnchor.constraint(equalToConstant: 15),

        ])
        translatesAutoresizingMaskIntoConstraints = false
        headlineLabel.setAsEmptyStateHeadLine()
        subHeadLaebl.setFontSize(size: 14)
        backgroundColor = .clear
    }
    
    private func setData(){
        headlineLabel.setText(text: "Your Inbox is empty")
        subHeadLaebl.setDesc(desc: "All Added products will be listed \n in this folder")
        linesIMV.setImage(img: Images.linesIVector)
        boxIMV.setImage(img: Images.boxVector)
        backGIMV.setImage(img: Images.backGVector)
        subHeadLaebl.textAlignment = .center
    }
    
    private func startAnimation(){
        UIView.animate(withDuration: 2, delay: 1,options: [.repeat, .autoreverse],
            animations: {
                self.backGIMV.transform = CGAffineTransform(scaleX: 0.6, y: 1)
                self.boxIMV.transform = CGAffineTransform(translationX: 0, y: 10)
                self.linesIMV.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
            },
            completion: { _ in
                UIView.animate(withDuration: 1) { [weak self] in
                    guard let self = self else {return}
                    self.backGIMV.transform = CGAffineTransform.identity
                    self.boxIMV.transform = CGAffineTransform.identity
                    self.linesIMV.transform = CGAffineTransform.identity
                }
            })
    }
    
}

