//
//  UITextFeild+EXt.swift
//  NikeTask
//
//  Created by Amr Moussa on 23/09/2021.
//
import UIKit
extension UITextField {
    func addButtomLine(){
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(origin: CGPoint(x: 0, y:self.bounds.height - 1), size: CGSize(width: self.bounds.width, height:  1))
        bottomLine.backgroundColor = UIColor.systemGray6.cgColor
        self.borderStyle = UITextField.BorderStyle.none
        self.layer.addSublayer(bottomLine)
    }
}
