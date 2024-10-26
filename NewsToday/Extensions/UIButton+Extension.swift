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
}
