//
//  UILabel + Extention.swift
//  NewsToday
//
//  Created by Надежда Капацина on 27.10.2024.
//

import UIKit

extension UILabel {
    
    static func makeLabel(text: String = "", font: UIFont?, textColor: UIColor, numberOfLines: Int?) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        label.textColor = textColor
        label.numberOfLines = numberOfLines ?? 0
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}

