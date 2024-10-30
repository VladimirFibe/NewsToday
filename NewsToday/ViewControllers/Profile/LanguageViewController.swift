//
//  LanguageViewController.swift
//  NewToday
//
//  Created by Александр Гуркин on 24.10.2024.
//

import UIKit

class LanguageViewController: UIViewController {

    //    MARK: - UI Elements

    private lazy var backgroundViewColor: UIView = {
        let element = UIView()
        element.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    private lazy var backButton: UIButton = {
        let element = UIButton()
        element.setImage(UIImage(named: "left-icon"), for: .normal)
        element.translatesAutoresizingMaskIntoConstraints = false
        element.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    
        let customBackButton = UIBarButtonItem(customView: element)
        navigationItem.leftBarButtonItem = customBackButton
        
        return element
    }()
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    private lazy var englishButton: UIButton = {

        var configuration = UIButton.Configuration.filled()
        configuration.title = "English"
        configuration.attributedTitle?.font = UIFont(name: "Inter-SemiBold", size: 16)
        configuration.titleAlignment = .leading
        configuration.baseForegroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)

        configuration.image = UIImage(named: "check")
        configuration.imagePlacement = .trailing
        configuration.imagePadding = 215
        configuration.background.cornerRadius = 12
        configuration.baseBackgroundColor = UIColor(red: 71/255, green: 90/255, blue: 215/255, alpha: 1)

        configuration.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 24, bottom: 16, trailing: 16)

        let element = UIButton(configuration: configuration)
        element.addTarget(self, action: #selector(englishButtonTapped), for: .touchUpInside)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    @objc func englishButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    private lazy var russianButton: UIButton = {

        var configuration = UIButton.Configuration.filled()
        configuration.title = "Russian"
        configuration.attributedTitle?.font = UIFont(name: "Inter-SemiBold", size: 16)
        configuration.titleAlignment = .leading
        configuration.baseForegroundColor = UIColor(red: 102/255, green: 108/255, blue: 142/255, alpha: 1)
        configuration.image = UIImage(named: "check")
        configuration.imagePlacement = .trailing
        configuration.imagePadding = 211
        configuration.background.cornerRadius = 12
        configuration.baseBackgroundColor = UIColor(red: 243/255, green: 244/255, blue: 246/255, alpha: 1)

        configuration.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 24, bottom: 16, trailing: 16)

        let element = UIButton(configuration: configuration)
        element.addTarget(self, action: #selector(russianButtonTapped), for: .touchUpInside)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    @objc func russianButtonTapped() {
        navigationController?.popViewController(animated: true)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewsConstraints()
        
//        navigationItem.titleView = UILa
    }
    
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         navigationController?.navigationBar.isHidden = false
         navigationItem.title = "Language"
        navigationController!.navigationBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 28)
        
        navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 51/255, green: 54/255, blue: 71/255, alpha: 1), NSAttributedString.Key.font: UIFont.init(name: "Inter-SemiBold", size: 24)]
        
     }
    
    
    private func setupViewsConstraints() {
        view.addSubview(backgroundViewColor)
        view.addSubview(backButton)
        view.addSubview(englishButton)
        view.addSubview(russianButton)
        
        NSLayoutConstraint.activate([
            backgroundViewColor.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundViewColor.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundViewColor.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundViewColor.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 28),
            backButton.widthAnchor.constraint(equalToConstant: 24),
            backButton.heightAnchor.constraint(equalToConstant: 24),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        
            englishButton.widthAnchor.constraint(equalToConstant: 336),
            englishButton.heightAnchor.constraint(equalToConstant: 56),
            englishButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 1),
            englishButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            
            russianButton.widthAnchor.constraint(equalToConstant: 336),
            russianButton.heightAnchor.constraint(equalToConstant: 56),
            russianButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 1),
            russianButton.topAnchor.constraint(equalTo: englishButton.bottomAnchor, constant: 16),
            
        ])
    }
   
}

