//
//  FavoriteViewCell.swift
//  NewsToday
//
//  Created by Vika on 31.10.24.
//

import UIKit

class FavoriteViewCell: UICollectionViewCell {
    
    private let iconLabel = UILabel()
    private let titleLabel = UILabel()
    private let stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStyle()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupStyle()
        setupLayout()
    }
    
    private func setupStyle() {
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 12
    }
    
    private func setupLayout() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(iconLabel)
        stackView.addArrangedSubview(titleLabel)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            iconLabel.trailingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: -10)
        ])
    }
    
    func configure(with icon: String, title: String, isSelected: Bool) {
        iconLabel.text = icon
        titleLabel.text = title
        titleLabel.font = UIFont(name: "Inter-Medium", size: 16)
        
        if isSelected {
            contentView.backgroundColor = UIColor(named: "brandPurple")
            titleLabel.textColor = .white
        } else {
            contentView.backgroundColor = UIColor(named: "GrayLight")
            titleLabel.textColor = UIColor(named: "GrayTextButton")
        }
    }
}
