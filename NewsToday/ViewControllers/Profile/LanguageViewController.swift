//
//  LanguageViewController.swift
//  NewToday
//
//  Created by Александр Гуркин on 24.10.2024.
//

import UIKit

class LanguageViewController: UIViewController {
    
    //    MARK: - UI Elements
    
    let imageButton = UIImage(named: "check")
    var tittleButton = "Russian"
    
    //    MARK: - кнопка "назад" + header
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "left-icon"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        let customBackButton = UIBarButtonItem(customView: button)
        navigationItem.leftBarButtonItem = customBackButton
        
        return button
    }()
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Language"
        
        navigationController!.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor(named: "black Primary") ?? .darkGray,
            NSAttributedString.Key.font: UIFont.init(name: "Inter-SemiBold", size: 24) ?? .boldSystemFont(ofSize: 24)
        ]
    }
    
    //MARK: - english button
    
    private lazy var englishButton: UIButton = {
        let imageButton = UIImage(named: "check")
        var configuration = UIButton.Configuration.filled()
        configuration.title = "English"
        configuration.attributedTitle?.font = UIFont(name: "Inter-SemiBold", size: 16)
        configuration.titleAlignment = .leading
        configuration.background.cornerRadius = 12
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 24, bottom: 16, trailing: 16)
        
        let button = UIButton(configuration: configuration)
        button.isSelected = true
        button.configurationUpdateHandler = updateButtonAppearance
        button.configuration?.titleAlignment = .leading
        button.addTarget(self, action: #selector(englishButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func englishButtonTapped() {
        if !englishButton.isSelected {
            englishButton.isSelected = true
            russianButton.isSelected = false
        }
        //            UserDefaults.standard.set(sender.isSelected, forKey: "selectedLanguage")
    }
    
    //MARK: - russian button
    
    private lazy var russianButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Русский"
        configuration.attributedTitle?.font = UIFont(name: "Inter-SemiBold", size: 16)
        configuration.titleAlignment = .leading
        configuration.background.cornerRadius = 12
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 24, bottom: 16, trailing: 16)
        
        let button = UIButton(configuration: configuration)
        button.isSelected = false // По умолчанию "Русский" не выбран
        button.contentHorizontalAlignment = .leading // Выровнять текст по левому краю
        button.configurationUpdateHandler = updateButtonAppearance
        button.addTarget(self, action: #selector(russianButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func russianButtonTapped() {
        if !russianButton.isSelected {
            russianButton.isSelected = true
            englishButton.isSelected = false
        }
        //            UserDefaults.standard.set(sender.isSelected, forKey: "selectedLanguage")
    }
    
    //MARK: - Обработчик для обновления внешнего вида кнопки в зависимости от состояния
    
    private func updateButtonAppearance(_ button: UIButton) {
        if button.isSelected {
            button.configuration?.baseForegroundColor = .white
            button.configuration?.baseBackgroundColor = #colorLiteral(red: 0.278, green: 0.353, blue: 0.843, alpha: 1)
            button.configuration?.image = imageButton
            button.configuration?.imagePlacement = .trailing
            button.configuration?.titleAlignment = .leading
            button.contentHorizontalAlignment = .leading // Выровнять текст по левому краю
            button.configuration?.imagePadding = 265 // отступ от текста до иконки
        } else {
            button.configuration?.baseForegroundColor = #colorLiteral(red: 0.4, green: 0.4235, blue: 0.5569, alpha: 1)
            button.configuration?.baseBackgroundColor = #colorLiteral(red: 0.953, green: 0.957, blue: 0.965, alpha: 1)
            button.configuration?.image = nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViewsConstraints()
    }
    
    private func setupViewsConstraints() {
        view.addSubview(backButton)
        view.addSubview(englishButton)
        view.addSubview(russianButton)
        
        NSLayoutConstraint.activate([
            
            backButton.heightAnchor.constraint(equalToConstant: 26),
            backButton.widthAnchor.constraint(equalToConstant: 26),
            
            englishButton.heightAnchor.constraint(equalToConstant: 56),
            englishButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            englishButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            englishButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            englishButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),

            russianButton.heightAnchor.constraint(equalToConstant: 56),
            russianButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            russianButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            russianButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            russianButton.topAnchor.constraint(equalTo: englishButton.bottomAnchor, constant: 16),
        ])
    }
}
