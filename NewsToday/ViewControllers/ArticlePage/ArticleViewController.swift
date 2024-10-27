//
//  ArticleViewController.swift
//  NewsToday
//
//  Created by Надежда Капацина on 26.10.2024.
//

import UIKit

class ArticleViewController: UIViewController {
    

    
    //MARK: - Private properties
    
    //var data = [Article]() // здесь будут данные из интернета
    var tag: String = "Politic"
    var isArticleSaved = true
    
    //MARK: - UI Components

    private let scrollView: UIScrollView = {
        let element = UIScrollView()
        element.showsVerticalScrollIndicator = true
        return element
    }()
    
    private let contentView: UIView = {
        let element = UIView()
        return element
    }()
    
    private let articleImageView: UIImageView = {
        let element = UIImageView()
        element.contentMode = .scaleAspectFill
        return element
    }()
    
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

        element.textColor =  .black
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
//        scrollView = UIScrollView(frame: self.view.bounds)
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(articleImageView)
        contentView.addSubview(blackView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(authorLabel)
    
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize = self.contentView.bounds.size
        //настройка картинки
        
        articleImageView.translatesAutoresizingMaskIntoConstraints = false
        articleImageView.image = UIImage(named: "samplePolitics")

        
        blackView.translatesAutoresizingMaskIntoConstraints = false

        

        
        
        
        NSLayoutConstraint.activate([
            
//            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
//            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//           
//            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
//            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
//            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
//            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
//
//            
//            articleImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
//            articleImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            articleImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            articleImageView.heightAnchor.constraint(equalToConstant: 370),
//        
//            blackView.topAnchor.constraint(equalTo: articleImageView.topAnchor),
//            blackView.trailingAnchor.constraint(equalTo: articleImageView.trailingAnchor),
//            blackView.leadingAnchor.constraint(equalTo: articleImageView.leadingAnchor),
//            blackView.heightAnchor.constraint(equalTo: articleImageView.heightAnchor),
//        
//            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 216),
//            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
//            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
//            
//            nameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
//            nameLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
//            
//            authorLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 6),
//            authorLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),

        
        ])
    }
}
