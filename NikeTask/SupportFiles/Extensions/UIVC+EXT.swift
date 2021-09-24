//
//  UIVC+EXT.swift
//  NikeTask
//
//  Created by Amr Moussa on 23/09/2021.
//

import UIKit


extension UIViewController {
    
    @objc func dissmisVC(){
       dismiss(animated: true)
    
     }
    
    func showLoadingView() -> UIView {
        let containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
        
        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0
        
        UIView.animate(withDuration: 0.25) { containerView.alpha = 0.8 }
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndicator)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
        
        activityIndicator.startAnimating()
        return containerView
    }
    
    func dismissLoadingView(view:UIView) {
        DispatchQueue.main.async {
            view.removeFromSuperview()
        }
    }
    
    

    func showToast(message : String, font: UIFont? = UIFont.systemFont(ofSize: 19)
                   ,icon:UIImage? = Images.checkMark) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 100, y: self.view.frame.size.height-100, width: 200, height: 40))
        toastLabel.roundShape()
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center
        
        let fullString = NSMutableAttributedString(string: " ")
        let imgAttachment = NSTextAttachment()
        imgAttachment.bounds = CGRect(x: -5, y: -3 , width: 20, height: 20)
        imgAttachment.image = icon
        let image1String = NSAttributedString(attachment: imgAttachment)
        fullString.append(image1String)
        fullString.append(NSAttributedString(string: "  " +  message))

        toastLabel.attributedText = fullString
        toastLabel.alpha = 1.0
        
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 20.0, delay: 0.1, options: .curveEaseOut, animations: {
             toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    

    
    
    
}
