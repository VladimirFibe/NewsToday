//
//  BookMarksVC.swift
//  NewsToday
//
//  Created by Надежда Капацина on 23.10.2024.
//

import UIKit


class BookMarksViewController: UIViewController {
    
    // MARK: - UI
    

    private let titleLabel: UILabel = {
        let element = UILabel()
        element.font = UIFont.systemFont(ofSize: 24, weight: .semibold)

        element.textColor =  UIColor(red:0.2, green: 0.21, blue: 0.28, alpha:1)
        element.text = "Bookmarks"
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    private let describeLabel: UILabel = {
        let element = UILabel()
        element.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        element.textColor = UIColor(red:0.49, green: 0.51, blue: 0.63, alpha:1)
        element.text = "Saved articles to the library"
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    let bookMarksTableView = UITableView()
    
    // MARK: - Property
    
    private var news: [News] = []

    let identifire = "bookMarksCellid"

    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupView()

    }
    
    
    // MARK: - SetupView
    
    func setupView() {
        view.addSubview(titleLabel)
        view.addSubview(describeLabel)
        view.addSubview(bookMarksTableView)
        
        bookMarksTableView.translatesAutoresizingMaskIntoConstraints = false
        
//        bookMarksTableView.delegate = self
        bookMarksTableView.register(BookMarksCell.self, forCellReuseIdentifier: identifire)
        bookMarksTableView.dataSource = self
        bookMarksTableView.backgroundColor = .blue
        describeLabel.backgroundColor = .yellow
        
       
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            describeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            describeLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            
            bookMarksTableView.topAnchor.constraint(equalTo: describeLabel.bottomAnchor, constant: 32),
            bookMarksTableView.leadingAnchor.constraint(equalTo: describeLabel.leadingAnchor),
            bookMarksTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            bookMarksTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
                ])
        


    }
}
// MARK: - UiTableViewDataSource

extension BookMarksViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return news.count
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifire, for: indexPath)

        return cell
        
    }
}

 //MARK: - UiTableViewDelegate

    extension BookMarksViewController: UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
        }
    }
