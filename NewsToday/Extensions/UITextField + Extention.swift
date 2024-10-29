//
//  UITextField + Extention.swift
//  NewsToday
//
//  Created by Надежда Капацина on 29.10.2024.
//
import UIKit

extension UITextField {
    static func makeTextField(placeholder: String, image: UIImage) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.textAlignment = .left
        textField.backgroundColor = UIColor(named: "greyLighter")
        textField.layer.cornerRadius = 10
        textField.font = UIFont(name: "Inter-Medium", size: 16)
        textField.textColor = UIColor(named: "GreyPrimary")
        textField.tintColor = .lightGray
        textField.autocapitalizationType = .none

        let iconView = UIImageView(frame: CGRect(x: 10, y: 10, width: 25, height: 25))
        iconView.image = image
        iconView.contentMode = .scaleAspectFit
        let iconContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 45))
        iconContainerView.addSubview(iconView)
        
        textField.leftView = iconContainerView
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textField.heightAnchor.constraint(equalToConstant: 60)
            ])
  
        
        return textField
    }
}
