//
//  UIButton+Extension.swift
//  NewsToday
//
//  Created by Vladimir Fibe on 26.10.2024.
//

import UIKit


extension UIView {
    func backgroundView() {
        let backgroundViewColor: UIView = {
            let element = UIView()
            element.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
            element.translatesAutoresizingMaskIntoConstraints = false
            return element
        }()
        self.addSubview(backgroundViewColor)
        
        NSLayoutConstraint.activate([
            backgroundViewColor.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundViewColor.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundViewColor.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            backgroundViewColor.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    func addButton(_ button: UIButton) {
        self.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 56),
            button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -19),
        ])
        
    }
}


extension UIButton {
    convenience init(title: String, image: String) {
        var configuration = UIButton.Configuration.filled()
        configuration.title = title
        configuration.attributedTitle?.font = UIFont(name: "Inter-SemiBold", size: 16)
        configuration.titleAlignment = .leading
        configuration.baseForegroundColor = #colorLiteral(red: 0.4, green: 0.4235294118, blue: 0.5568627451, alpha: 1)
        configuration.image = UIImage(named: image)
        configuration.imagePlacement = .trailing
        switch title {
        case "Sign Out" :
            configuration.imagePadding = 205
        case "Terms & Conditions":
            configuration.imagePadding = 121
        case "Language" :
            configuration.imagePadding = 195
        case "English", "Russian"  :
            configuration.imagePadding = 215
        default: print("error")
        }
        configuration.background.cornerRadius = 12
        configuration.baseBackgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9568627451, blue: 0.9647058824, alpha: 1)
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 24, bottom: 16, trailing: 16)

        self.init(configuration: configuration)
        self.translatesAutoresizingMaskIntoConstraints = false

    }
}
