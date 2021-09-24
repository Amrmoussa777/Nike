//
//  FilterVC.swift
//  NikeTask
//
//  Created by Amr Moussa on 23/09/2021.
//

import UIKit

class FilterVC: UIViewController {
    
    static let shared = FilterVC()
    lazy var  FilterPresenter =  FilterVCPresenter(view: self)
    let contentView = UIView()
    
    let titleLabel = NTLabel()
    let nameTF = NTTextfeild(placeHolder: Strings.namePlaceHolder)
    
    
    let slider = UISlider()
    let sliderLabel = DescLabel()
    
    let filterButton = alterProductButton()
    let resetButton = alterProductButton()

    private init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
            let outterPadding:CGFloat = 40
           NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor,constant: viewHeight/2.5),
               contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
               contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
               contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
           ])
           
           
           
           contentView.addSubViews(titleLabel,nameTF,slider,
                                   sliderLabel,filterButton,resetButton)
        slider.translatesAutoresizingMaskIntoConstraints = false
           NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: padding/2),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
               
            nameTF.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: padding),
            nameTF.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: padding),
            nameTF.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant:-padding),
            nameTF.heightAnchor.constraint(equalToConstant: 50),
            
            
            sliderLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: padding),
            sliderLabel.topAnchor.constraint(equalTo: nameTF.bottomAnchor, constant: outterPadding),
            sliderLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -padding),
            sliderLabel.heightAnchor.constraint(equalToConstant: 20),
            
            slider.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant:padding),
            slider.topAnchor.constraint(equalTo: sliderLabel.bottomAnchor),
            slider.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -padding),
            slider.heightAnchor.constraint(equalToConstant: 40),
            
            
            
            filterButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: padding),
            filterButton.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: outterPadding),
            filterButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -padding),
            filterButton.heightAnchor.constraint(equalToConstant: 50),
            
            resetButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: padding),
            resetButton.topAnchor.constraint(equalTo: filterButton.bottomAnchor, constant: padding),
            resetButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -padding),
            resetButton.heightAnchor.constraint(equalToConstant: 50),
  
           ])
        #warning("<#T##message###>")
        titleLabel.setText(text: "Filter")
        titleLabel.setAsTitleLabel()
        
        
        configureSLider()
        
        filterButton.setTitle(title: "Filter", BGC: .primaryBlue)
        resetButton.setTitle(title: "Reset", BGC: .systemBackground, TextColor: .primaryBlue)
       }
    
    
    private func configureSLider() {
        sliderLabel.setDesc(desc: "Price")
        sliderLabel.setFontSize(size: 17)
        slider.tintColor = .primaryBlue
        slider.thumbTintColor = .primaryBlue
        slider.setThumbImage(Images.sliderThumb, for: .normal)
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.setValue(1, animated: true)
        slider.minimumValueImage = Images.sliderMinImage
        slider.maximumValueImage = Images.sliderMaxImage
        
    }
    
    private func configureButtons(){
        #warning("<#T##message###>")
        filterButton.addTarget(FilterPresenter, action: #selector(FilterPresenter.filterPressed), for: .touchUpInside)
        resetButton.addTarget(FilterPresenter, action: #selector(FilterPresenter.resetPressed), for: .touchUpInside)
    }
   

}

extension FilterVC:UIGestureRecognizerDelegate{
    
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
