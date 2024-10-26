//
//  ArticleViewController.swift
//  NewsToday
//
//  Created by Надежда Капацина on 26.10.2024.
//

import UIKit

class ArticleViewController: UIViewController {
    
    // MARK: - Property

    private let articleImageView = UIImageView()
    
    private let blackView: UIView = {
        let element = UIView()
        element.backgroundColor = .black
        element.alpha = 0.48
        return element
    }()
    
    private let titleLabel: UILabel = {
        let element = UILabel()
        element.font = UIFont(name: "Inter-Bold", size: 20)

        element.textColor =  .white
        element.text = "The latest situation in the presidential election"
        element.numberOfLines = 0
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let nameLabel: UILabel = {
        let element = UILabel()
        element.font = UIFont(name: "Inter-Medium", size: 16)

        element.textColor =  .white
        element.text = "John Doe"
        element.numberOfLines = 0
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let authorLabel: UILabel = {
        let element = UILabel()
        element.font = UIFont(name: "Inter-Regular", size: 14)

        element.textColor =  .white
        element.text = "Author"
        element.numberOfLines = 0
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupView()

    }
    func setupView() {
        
        view.addSubview(articleImageView)
        view.addSubview(blackView)
        view.addSubview(titleLabel)
        view.addSubview(nameLabel)
        view.addSubview(authorLabel)
    //настройка картинки
        
        articleImageView.translatesAutoresizingMaskIntoConstraints = false
        articleImageView.image = UIImage(named: "samplePolitics")
        articleImageView.contentMode = .scaleAspectFill
        
        blackView.translatesAutoresizingMaskIntoConstraints = false
        

        
        
        
        NSLayoutConstraint.activate([
            articleImageView.topAnchor.constraint(equalTo: view.topAnchor),
            articleImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            articleImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            articleImageView.heightAnchor.constraint(equalToConstant: 370),
        
            blackView.topAnchor.constraint(equalTo: view.topAnchor),
            blackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            blackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blackView.heightAnchor.constraint(equalToConstant: 370),
        
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 216),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            nameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            nameLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            authorLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 6),
            authorLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor)
        
        ])
    }
}
