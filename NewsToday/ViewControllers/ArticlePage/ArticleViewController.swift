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
    
    var news: News?
    var tag: String = "Politic"
    var isArticleSaved = true
    
    //MARK: - UI Components
    
    private let scrollView: UIScrollView = {
        let element = UIScrollView()
        element.showsVerticalScrollIndicator = true
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let contentView: UIView = {
        let element = UIView()
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let articleImageView: UIImageView = {
        let element = UIImageView()
        element.contentMode = .scaleAspectFill
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let blackView: UIView = {
        let element = UIView()
        element.backgroundColor = .black
        element.alpha = 0.48
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    let bookmarkButton = UIButton(type: .system)
    let shareButton = UIButton(type: .system)
    let returnButton = UIButton(type: .system)
    
    private let labelView: UIView = {
        let element = UIView()
        element.backgroundColor = UIColor(named: "purplePrimary")
        element.layer.cornerRadius = 16
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let titleLabel = UILabel.makeLabel(font: UIFont(name: "Inter-Bold", size: 20),
                                               textColor: .white, numberOfLines: 0)
    
    private let nameLabel = UILabel.makeLabel(font: UIFont(name: "Inter-SemiBold", size: 16),
                                              textColor: .white, numberOfLines: 0)
    
    private let authorLabel = UILabel.makeLabel(font: UIFont(name: "Inter-Regular", size: 14),
                                                textColor: .white, numberOfLines: 0)
    
    private let articleLabel = UILabel.makeLabel(font: UIFont(name: "Inter-SemiBold", size: 16),
                                                 textColor: #colorLiteral(red: 0.200000003, green: 0.2099999934, blue: 0.2800000012, alpha: 1), numberOfLines: 0)
    
    private let categoryLabel = UILabel.makeLabel(font: UIFont(name: "Inter-Bold", size: 16),
                                                  textColor: .white, numberOfLines: 0)
    
    private let articleTextView: UITextView = {
        let element = UITextView()
        element.isEditable = false
        element.isScrollEnabled = false
        element.font = UIFont(name: "Inter-Regular", size: 16)
        element.translatesAutoresizingMaskIntoConstraints = false
        element.textColor = #colorLiteral(red: 0.4900000095, green: 0.5099999905, blue: 0.6299999952, alpha: 1)
        return element
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        setupConstraints()
        
        if let news = news {
                configureView(with: news)
            }
    }
    
    func setupView() {
        
        [articleImageView,  blackView, returnButton, titleLabel, titleLabel, nameLabel, authorLabel, articleLabel,  articleTextView, bookmarkButton, shareButton, labelView].forEach {contentView.addSubview($0) }
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        labelView.addSubview(categoryLabel)
        
        bookmarkButton.setImage(UIImage(named: "bookmark-icon"),for: .normal)
        bookmarkButton.addTarget(self, action: #selector(bookmarkButtonTapped), for: .touchUpInside)
        bookmarkButton.tintColor = .white
        bookmarkButton.translatesAutoresizingMaskIntoConstraints = false
        
        shareButton.setImage(UIImage(named: "share-icon"),for: .normal)
        shareButton.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        shareButton.tintColor = .white
        
        returnButton.setImage(UIImage(named: "left-icon"),for: .normal)
        returnButton.addTarget(self, action: #selector(returnButtonTapped), for: .touchUpInside)
        returnButton.translatesAutoresizingMaskIntoConstraints = false
        returnButton.tintColor = .white
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            bookmarkButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 60),
            bookmarkButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            bookmarkButton.widthAnchor.constraint(equalToConstant: 24),
            bookmarkButton.heightAnchor.constraint(equalToConstant: 24),
            
            returnButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 60),
            returnButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            returnButton.widthAnchor.constraint(equalToConstant: 24),
            returnButton.heightAnchor.constraint(equalToConstant: 24),
            
            shareButton.topAnchor.constraint(equalTo: bookmarkButton.bottomAnchor, constant: 20),
            shareButton.trailingAnchor.constraint(equalTo: bookmarkButton.trailingAnchor),
            shareButton.widthAnchor.constraint(equalTo: bookmarkButton.widthAnchor),
            shareButton.heightAnchor.constraint(equalTo: bookmarkButton.heightAnchor),
            
            
            articleImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            articleImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            articleImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            articleImageView.heightAnchor.constraint(equalToConstant: 370),
            
            blackView.topAnchor.constraint(equalTo: articleImageView.topAnchor),
            blackView.trailingAnchor.constraint(equalTo: articleImageView.trailingAnchor),
            blackView.leadingAnchor.constraint(equalTo: articleImageView.leadingAnchor),
            blackView.heightAnchor.constraint(equalTo: articleImageView.heightAnchor),
            
            labelView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 168),
            labelView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            labelView.widthAnchor.constraint(equalToConstant: 90),
            labelView.heightAnchor.constraint(equalToConstant: 40),
            
            categoryLabel.centerXAnchor.constraint(equalTo: labelView.centerXAnchor),
            categoryLabel.centerYAnchor.constraint(equalTo: labelView.centerYAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: labelView.bottomAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            titleLabel.leadingAnchor.constraint(equalTo: labelView.leadingAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            nameLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            authorLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 6),
            authorLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            articleLabel.topAnchor.constraint(equalTo: articleImageView.bottomAnchor, constant: 24),
            articleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            articleTextView.topAnchor.constraint(equalTo: articleLabel.bottomAnchor, constant: 8),
            articleTextView.leadingAnchor.constraint(equalTo: articleLabel.leadingAnchor, constant: -2),
            articleTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            contentView.bottomAnchor.constraint(equalTo: articleTextView.bottomAnchor, constant: 10)
        ])
    }
    
    @objc private func bookmarkButtonTapped() {
        
        bookmarkButton.isSelected.toggle()
        
        if bookmarkButton.isSelected {
            print("Закладка добавлена")
        } else {
            print("Закладка удалена")
        }
    }
    
    @objc private func shareButtonTapped() {
        
        print("кнопка поделиться нажата")
        
    }
    
    @objc private func returnButtonTapped() {
        
        dismiss(animated: true)
        
    }
    
    func configureView(with article: News) {
        self.news = article
        if let url = news?.urlToImage {
            articleImageView.kf.setImage(with: URL(string: url))
        }
        titleLabel.text = article.title
        nameLabel.text = article.author ?? "Unknown Author"
        authorLabel.text = "Author"
        articleLabel.text = "Results"
        articleTextView.text = article.description
        if let category = news?.category {
            categoryLabel.text = category.title
        } else {
            categoryLabel.text = "general" 
        }
    }
}

// моковые данные
//
//articleImageView.image = UIImage(named: "samplePolitics")
//titleLabel.text = "The latest situation in the presidential election"
//nameLabel.text = "John Doe"
//authorLabel.text = "Author"
//articleLabel.text = "Results"
//articleTextView.text = "Leads in individual states may change from one party to another as all the votes are counted. Select a state for detailed results, and select the Senate, House or Governor tabs to view those races. For more detailed state results click on the States A-Z links at the bottom of this page.Results source: NEP/Edison via Reuters.Leads in individual states may change from one party to another as all the votes are counted. Select a state for detailed results, and select the Senate, House or Governor tabs to view those races."
//categoryLabel.text = "Politics"
