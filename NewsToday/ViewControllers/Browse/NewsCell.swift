//
//  NewsCell.swift
//  NewToday
//
//  Created by Vika on 25.10.24.
//

import UIKit
import Kingfisher

class NewsCell: UICollectionViewCell {
    var news: News?
    
    static let identifier = "NewsCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let darkOverlay: UIView = {
        let overlay = UIView()
        overlay.backgroundColor = UIColor.black.withAlphaComponent(0.4) // 40% затемнение
        overlay.layer.cornerRadius = 12
        overlay.layer.masksToBounds = true
        overlay.translatesAutoresizingMaskIntoConstraints = false
        return overlay
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-Bold", size: 16)
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let tagLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Inter-Regular", size: 12)
        label.textColor = .white
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var bookmarkIcon: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "bookmark"), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleBookmark), for: .touchUpInside)
        return button
    }()
    
    @objc private func handleBookmark() {
        guard let news else { return }
        print(news.title)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(imageView)
        contentView.addSubview(darkOverlay)
        contentView.addSubview(titleLabel)
        contentView.addSubview(tagLabel)
        contentView.addSubview(bookmarkIcon)
        
        NSLayoutConstraint.activate([
            // ImageView
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            // Dark Overlay - поверх imageView
            darkOverlay.topAnchor.constraint(equalTo: imageView.topAnchor),
            darkOverlay.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            darkOverlay.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            darkOverlay.bottomAnchor.constraint(equalTo: imageView.bottomAnchor),
            
            // Title
            titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -8),
            titleLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(equalToConstant: 40), // Высота для двух строк
            
            // Tag Label
            tagLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 24),
            tagLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -8),
            tagLabel.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -8), // Отступ между тегом и заголовком
            tagLabel.heightAnchor.constraint(equalToConstant: 20),
            tagLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 50),
            
            
            // Bookmark Icon
            bookmarkIcon.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 8),
            bookmarkIcon.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -8),
            bookmarkIcon.widthAnchor.constraint(equalToConstant: 24),
            bookmarkIcon.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    // Конфигурация ячейки
    func configure(with news: News) {
        self.news = news
        titleLabel.text = news.title
        if let url = news.urlToImage {
            imageView.kf.setImage(with: URL(string: url))
        }
        tagLabel.text = news.category?.title ?? NewsCategory.general.title
        print("Category: \(news.category?.rawValue ?? "none")")
    }
}
