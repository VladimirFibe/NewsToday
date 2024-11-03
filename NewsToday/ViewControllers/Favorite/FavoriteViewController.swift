//
//  FavoriteViewController.swift
//  NewsToday
//
//  Created by Vika on 31.10.24.
//

import UIKit

class FavoriteViewController: UIViewController {
    
    // MARK: - Properties
    
    private var favorites: [Favorites] = [
        Favorites(icon: "🏈", title: "Sports", isSelected: false),
        Favorites(icon: "⚖️", title: "Politics", isSelected: false),
        Favorites(icon: "🌞", title: "Life", isSelected: false),
        Favorites(icon: "🎮", title: "Gaming", isSelected: false),
        Favorites(icon: "🐻", title: "Animals", isSelected: false),
        Favorites(icon: "🌴", title: "Nature", isSelected: false),
        Favorites(icon: "🍔", title: "Food", isSelected: false),
        Favorites(icon: "🎨", title: "Art", isSelected: false),
        Favorites(icon: "🧶", title: "History", isSelected: false),
        Favorites(icon: "👗", title: "Fashion", isSelected: false),
    ]
    
    private var selectedCategories = Set<Int>()
    
    // MARK: - UI Elements
    
    private lazy var favoriteView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 16
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        
        let favoriteView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        favoriteView.dataSource = self
        favoriteView.delegate = self
        favoriteView.register(FavoriteViewCell.self, forCellWithReuseIdentifier: "CategoryCell")
        return favoriteView
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.backgroundColor = UIColor(named: "brandPurple")
        button.tintColor = .white
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupHeaderView()
        setupLayout()
        
        DispatchQueue.main.async {
            self.favoriteView.reloadData()
        }
    }
    
    // MARK: - Setup Methods
    
    private func setupHeaderView() {
        view.addHeader(
            title: "Select your favorite topics",
            subTitle: "Select some of your favorite topics to let us suggest better news for you."
        )
    }
    
    private func setupLayout() {
        view.addSubview(favoriteView)
        view.addSubview(nextButton)
        
        favoriteView.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            favoriteView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 105),
            favoriteView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            favoriteView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            favoriteView.heightAnchor.constraint(equalToConstant: 460),
            
            nextButton.topAnchor.constraint(equalTo: favoriteView.bottomAnchor, constant: 16),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nextButton.heightAnchor.constraint(equalToConstant: 56),
            nextButton.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    // MARK: - Actions
    
    @objc private func nextButtonTapped() {
        
        // сохранение данных о выбранных категориях 
        let selectedFavorites = favorites.filter { $0.isSelected }.map { $0.title }
            UserDefaults.standard.set(selectedFavorites, forKey: "selectedFavorites")
        
        // TODO: Реализовать переход на следующий экран
        let browseVC = BrowseViewController()
            navigationController?.pushViewController(browseVC, animated: true)
    }
}

// MARK: - UICollectionViewDataSource & UICollectionViewDelegateFlowLayout

extension FavoriteViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! FavoriteViewCell
        let favorite = favorites[indexPath.item]
        
        cell.configure(with: favorite.icon,
                       title: favorite.title,
                       isSelected: favorite.isSelected)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        // Обработка выбора категории
        var favorite = favorites[indexPath.item]
        favorite.isSelected.toggle() // Переключите состояние выбора
        favorites[indexPath.item] = favorite // Обновите массив категорий
        collectionView.reloadItems(at: [indexPath])
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Расчет размера ячейки
        let width = (collectionView.frame.width - 60) / 2
        return CGSize(width: width, height: 72)
    }
}
