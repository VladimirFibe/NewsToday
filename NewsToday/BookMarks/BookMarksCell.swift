//
//  BookMarksCell.swift
//  NewsToday
//
//  Created by Надежда Капацина on 23.10.2024.

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
        
        imageIV.layer.cornerRadius = 12
        imageIV.layer.masksToBounds = true
        
        
        addSubview(imageIV)
        addSubview(nameLabel)
        addSubview(titleLabel)
        
        
        
        
        imageIV.contentMode = .scaleAspectFill

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
            
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: imageIV.trailingAnchor, constant: 15),
            
            titleLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                ])
        
        
    }
  
    public func configure(with news: News) {
        
        nameLabel.text = news.sourse.name
        titleLabel.text = news.title
        imageIV.image = UIImage(named: news.urlToImage ?? "")

    }
}
