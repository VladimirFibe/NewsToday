//
//  BrowseViewController.swift
//  NewToday
//
//  Created by Vika on 25.10.24.
//

import UIKit

class BrowseViewController: UIViewController, UISearchBarDelegate, UITextFieldDelegate {
    
    private let searchBar = CustomSearchView()
    private let store = BrowseStore()
    private var bag = Bag()
    private var news: [News] = []
    
    private lazy var tabsView: TabsView = {
        let tabsView = TabsView(buttonTitles: ["Random", "Sports", "Gaming",
                                               "Politics", "Art", "Health"])
        tabsView.delegate = self
        return tabsView
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 256, height: 256)
        layout.minimumLineSpacing = 16
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(NewsCell.self, forCellWithReuseIdentifier: NewsCell.identifier)
        return collectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
        
        setupHeaderView()
        setupSearchView()
        setupTabsView()
        setupCollectionView()
        store.sendAction(.fetch)
        setupObservers()
    }
    
    private func setupObservers() {
        store
            .events
            .receive(on: DispatchQueue.main)
            .sink { [weak self] event in
                guard let self = self else { return }
                switch event {
                case let .didLoadSections(news):
                    self.reloadNews(news)
                }
            }.store(in: &bag)
    }
    
    private func reloadNews(_ news: [News]) {
        self.news = news
        collectionView.reloadData()
    }
    
    private func setupHeaderView() {
        view.addHeader(
            title: "Browse",
            subTitle: "Discover things of this world"
        )
    }
    
    private func setupSearchView() {
        searchBar.delegate = self
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.layer.borderWidth = 0
        searchBar.layer.cornerRadius = 12
        
        view.addSubview(searchBar)
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 105),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            searchBar.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    private func setupTabsView() {
        tabsView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tabsView)
        
        NSLayoutConstraint.activate([
            tabsView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 24),
            tabsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tabsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabsView.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: tabsView.bottomAnchor, constant: 24),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 256)
        ])
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16)
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate

extension BrowseViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return news.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsCell.identifier, for: indexPath) as? NewsCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(with: news[indexPath.item])
        return cell
    }
}

// MARK: - TabsViewDelegate (обработка смены таба)

extension BrowseViewController: TabsViewDelegate {
    func tabsView(_ tabBarView: TabsView, didSelectTabAt index: Int) {
        print("Selected tab index: \(index)")
    }
}
