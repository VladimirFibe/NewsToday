//
//  UIView+Extensions.swift
//  NewsToday
//
//  Created by Vladimir Fibe on 26.10.2024.
//

import UIKit

extension UIView {
    
    func addHeader(title: String, subTitle: String) {
        let headerLabel: UILabel = {
            let label = UILabel()
            label.text = title
            label.font = UIFont(name: "Inter-SemiBold", size: 24) ?? .boldSystemFont(ofSize: 24)
            label.textAlignment = .left
            label.textColor = UIColor(named: "black Primary")
            label.numberOfLines = 0
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let subHeaderLabel: UILabel = {
            let label = UILabel()
            label.text = subTitle
            label.font = UIFont(name: "Inter-Regular", size: 16) ?? .systemFont(ofSize: 16)
            label.textColor = UIColor(named: "GreyPrimary")
            label.textAlignment = .left
            label.numberOfLines = 0
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        addSubview(headerLabel)
        addSubview(subHeaderLabel)
        
        // Constraints для хедера
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            headerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            subHeaderLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 8),
            subHeaderLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            subHeaderLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
        ])
    }
}

