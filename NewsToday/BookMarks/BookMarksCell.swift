//
//  BookMarksCell.swift
//  NewsToday
//
//  Created by Надежда Капацина on 23.10.2024.
//

import UIKit

class BookMarksCell: UITableViewCell {
    
    
    var imageIV = UIImageView()
    var categoryLabel = UILabel()
    let titleLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Setup
  

   
    func setupView() {
        addSubview(imageIV)
        addSubview(categoryLabel)
        addSubview(titleLabel)
        
        
        imageIV.backgroundColor = .red
        imageIV.layer.cornerRadius = 12
        
        categoryLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        categoryLabel.textColor = UIColor(red:0.2, green: 0.21, blue: 0.28, alpha:1)
       
        
        NSLayoutConstraint.activate([
            imageIV.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageIV.topAnchor.constraint(equalTo: self.topAnchor),
            imageIV.widthAnchor.constraint(equalToConstant: 96),
            imageIV.heightAnchor.constraint(equalToConstant: 96),
            
            categoryLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            categoryLabel.leadingAnchor.constraint(equalTo: self.trailingAnchor, constant: 16)
                ])
        imageIV.translatesAutoresizingMaskIntoConstraints = false
        
    }
  
    public func configure(with news: News) {
        categoryLabel.text = news.author
        titleLabel.text = news.title

    }
}
