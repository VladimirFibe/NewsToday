//
//  BookMarksCell.swift
//  NewsToday
//
//  Created by Надежда Капацина on 23.10.2024.
//

// Кастомная ячейка для статьи
//class ArticleCell: UITableViewCell {
//    
//    let articleImageView = UIImageView()
//    let titleLabel = UILabel()
//    let topicLabel = UILabel()
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        
//        articleImageView.translatesAutoresizingMaskIntoConstraints = false
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        topicLabel.translatesAutoresizingMaskIntoConstraints = false
//        
//        contentView.addSubview(articleImageView)
//        contentView.addSubview(titleLabel)
//        contentView.addSubview(topicLabel)
//        
//        NSLayoutConstraint.activate([
//            articleImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//            articleImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            articleImageView.widthAnchor.constraint(equalToConstant: 50),
//            articleImageView.heightAnchor.constraint(equalToConstant: 50),
//            
//            titleLabel.leadingAnchor.constraint(equalTo: articleImageView.trailingAnchor, constant: 16),
//            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
//            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
//            
//            topicLabel.leadingAnchor.constraint(equalTo: articleImageView.trailingAnchor, constant: 16),
//            topicLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
//            topicLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
//            topicLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
//        ])
//        
//        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
//        topicLabel.font = UIFont.systemFont(ofSize: 14)
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
//
//

import UIKit

class BookMarksCell: UITableViewCell {
    
    static let identifire = "bookMarksCellid"
    var imageIV = UIImageView()
    var nameLabel = UILabel()
    let titleLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Setup
  
    func setupView() {
        
        imageIV.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(imageIV)
        addSubview(nameLabel)
        addSubview(titleLabel)
        
        
        imageIV.layer.cornerRadius = 12
        
        nameLabel.font = UIFont(name: "Inter-Regular", size: 14)
        nameLabel.textColor = .greyPrimary
        
        titleLabel.font = UIFont(name: "Inter-Medium", size: 16)
        titleLabel.textColor = .blackPrimary
        //titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 0
       
        
        NSLayoutConstraint.activate([
            imageIV.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageIV.topAnchor.constraint(equalTo: self.topAnchor),
            imageIV.widthAnchor.constraint(equalToConstant: 96),
            imageIV.heightAnchor.constraint(equalToConstant: 96),
            
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: imageIV.trailingAnchor, constant: 16),
            
            titleLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
                ])
        
        
    }
  
    public func configure(with news: News) {
        
        nameLabel.text = news.sourse.name
        titleLabel.text = news.title
        imageIV.image = UIImage(named: news.urlToImage ?? "")

    }
}
