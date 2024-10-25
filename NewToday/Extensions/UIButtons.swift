//
//  UIButtons.swift
//  NewToday
//
//  Created by Александр Гуркин on 24.10.2024.
//

import Foundation
import UIKit

extension UIButton {
    convenience init(name: String) {
        self.init()
        self.contentMode = .scaleAspectFit
        self.setImage(UIImage(named: name), for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false

    }
}
