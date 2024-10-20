//
//  ViewController.swift
//  NewsToday
//
//  Created by Vladimir Fibe on 20.10.2024.
//

import UIKit

class BrowseViewController: UITableViewController {
    private var news: [News] = []
    private var bag = Bag()
    private let store = BrowseStore()
    override func viewDidLoad() {
        super.viewDidLoad()
        store.sendAction(.fetch)
        view.backgroundColor = .systemBackground
        tableView.register(BrowseCell.self, forCellReuseIdentifier: BrowseCell.identifier)
        setupObservers()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        news.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BrowseCell.identifier, for: indexPath) as? BrowseCell else { fatalError()}
        cell.configure(with: news[indexPath.row])
        return cell
    }
    
    private func setupObservers() {
        store
            .events
            .receive(on: DispatchQueue.main)
            .sink { [weak self] event in
                guard let self else { return }
                switch event {
                case .done(let news):
                    self.news = news
                    self.tableView.reloadData()
                }
            }.store(in: &bag)
    }
}

final class BrowseCell: UITableViewCell {
    static let identifier = "BrowseCell"
    
    public func configure(with news: News) {
        textLabel?.text = news.title
    }
}

struct News: Decodable {
  let author: String?
  let title: String?
  let description: String?
  let urlToImage: String?
  let url: String?
}

struct NewsEnvelope: Decodable {
  let status: String
  let totalResults: Int
  let articles: [News]
}
