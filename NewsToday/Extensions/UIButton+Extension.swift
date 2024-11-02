//
//  UIButton+Extension.swift
//  NewsToday
//
//  Created by Vladimir Fibe on 26.10.2024.
//

import UIKit

extension UIButton {
    convenience init(name: String) {
        self.init()
        self.contentMode = .scaleAspectFit
        self.setImage(UIImage(named: name), for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false

    }
    static func createButton(
        title: String,
        uiFont: UIFont = UIFont(name:"Inter-SemiBold", size: 16)!,
        foregroundColor: UIColor = .white,
        backgroundColor: UIColor = UIColor(named: "purplePrimary")!,
        cornerRadius: CGFloat = 10,
        buttonHeight: CGFloat = 60,
        borderColor: UIColor = .clear,
        borderWidth: CGFloat = 0
    ) -> UIButton {
        let button = UIButton(type: .system)

        
        var config = UIButton.Configuration.filled()
        config.baseForegroundColor = foregroundColor
        config.baseBackgroundColor = backgroundColor

        
        config.title = title
        
       
        config.attributedTitle = AttributedString(title, attributes: AttributeContainer([.font: uiFont]))

        button.configuration = config
        button.layer.cornerRadius = cornerRadius
        button.layer.masksToBounds = true

        button.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true

        button.layer.borderColor = borderColor.cgColor
        button.layer.borderWidth = borderWidth

        return button
    }
}
