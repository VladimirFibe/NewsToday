//
//  ProfileViewController.swift
//  NewToday
//
//  Created by Александр Гуркин on 24.10.2024.
//

import UIKit

class ProfileViewController: UIViewController {

    //    MARK: - UI Elements

    private lazy var backgroundViewColor: UIView = {
        let element = UIView()
        element.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    private lazy var infoStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .horizontal
        element.spacing = 24
        element.distribution = .fill
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    private lazy var verticalStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.spacing = 0
        element.distribution = .fill
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    private lazy var pictureUser: UIImageView = {
        let element = UIImageView()
        element.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
        element.image = UIImage(named: "pictureUser")
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    private lazy var mainLabel: UILabel = {
        let element = UILabel()
        element.text = "Profile"
        element.textColor = UIColor(red: 51/255, green: 54/255, blue: 71/255, alpha: 1)
        element.font = UIFont(name: "Inter-SemiBold", size: 24)
        element.textAlignment = .left
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    
    private lazy var nameLabel: UILabel = {
        let element = UILabel()
        element.text = "Dev P"
        element.textColor = UIColor(red: 51/255, green: 54/255, blue: 71/255, alpha: 1)
        element.font = UIFont(name: "Inter-SemiBold", size: 16)
        element.textAlignment = .left
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var mailLabel: UILabel = {
        let element = UILabel()
        element.text = "dev@gmail.com"
        element.textColor = UIColor(red: 124/255, green: 130/255, blue: 161/255, alpha: 1)
        element.font = UIFont(name: "Inter-Regular", size: 14)
        element.textAlignment = .left
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var signOutButton: UIButton = {

        var configuration = UIButton.Configuration.filled()
        configuration.title = "Sign Out"
        configuration.attributedTitle?.font = UIFont(name: "Inter-SemiBold", size: 16)
        configuration.titleAlignment = .leading
        configuration.baseForegroundColor = UIColor(red: 102/255, green: 108/255, blue: 142/255, alpha: 1)
        configuration.image = UIImage(named: "signout")
        configuration.imagePlacement = .trailing
        configuration.imagePadding = 205
        configuration.background.cornerRadius = 12
        configuration.baseBackgroundColor = UIColor(red: 243/255, green: 244/255, blue: 246/255, alpha: 1)
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 24, bottom: 16, trailing: 16)

        let element = UIButton(configuration: configuration)
        element.addTarget(self, action: #selector(signoutButtonTapped), for: .touchUpInside)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var termsConditionsButton: UIButton = {

        var configuration = UIButton.Configuration.filled()
        configuration.title = "Terms & Conditions"
        configuration.attributedTitle?.font = UIFont(name: "Inter-SemiBold", size: 16)
        configuration.titleAlignment = .leading
        configuration.baseForegroundColor = UIColor(red: 102/255, green: 108/255, blue: 142/255, alpha: 1)
        configuration.image = UIImage(named: "angle-right")
        configuration.imagePlacement = .trailing
        configuration.imagePadding = 121
        configuration.background.cornerRadius = 12
        configuration.baseBackgroundColor = UIColor(red: 243/255, green: 244/255, blue: 246/255, alpha: 1)
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 24, bottom: 16, trailing: 16)

        let element = UIButton(configuration: configuration)
        element.addTarget(self, action: #selector(termsConditionsButtonTapped), for: .touchUpInside)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var languageButton: UIButton = {

        var configuration = UIButton.Configuration.filled()
        configuration.title = "Language"
        configuration.attributedTitle?.font = UIFont(name: "Inter-SemiBold", size: 16)
        configuration.titleAlignment = .leading
        configuration.baseForegroundColor = UIColor(red: 102/255, green: 108/255, blue: 142/255, alpha: 1)
        configuration.image = UIImage(named: "angle-right")
        configuration.imagePlacement = .trailing
        configuration.imagePadding = 195
        configuration.background.cornerRadius = 12
        configuration.baseBackgroundColor = UIColor(red: 243/255, green: 244/255, blue: 246/255, alpha: 1)
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 24, bottom: 16, trailing: 16)

        let element = UIButton(configuration: configuration)
        element.addTarget(self, action: #selector(languageButtonTapped), for: .touchUpInside)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    //     MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewsConstrains()
       
    }

    //     MARK: - UI Setup

    private func setupViewsConstrains() {
        view.addSubview(backgroundViewColor)
        view.addSubview(mainLabel)
        view.addSubview(infoStackView)
        infoStackView.addArrangedSubview(pictureUser)
        infoStackView.addArrangedSubview(verticalStackView)
        
        verticalStackView.addArrangedSubview(nameLabel)
        verticalStackView.addArrangedSubview(mailLabel)
        
        view.addSubview(signOutButton)
        view.addSubview(termsConditionsButton)
        view.addSubview(languageButton)
        
        NSLayoutConstraint.activate([
            backgroundViewColor.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundViewColor.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundViewColor.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundViewColor.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            mainLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 72),
            mainLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            infoStackView.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 32),
            infoStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            infoStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            nameLabel.topAnchor.constraint(equalTo: infoStackView.topAnchor, constant: 12),
            mailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            
            pictureUser.widthAnchor.constraint(equalToConstant: 72),
            pictureUser.heightAnchor.constraint(equalToConstant: 72),
            pictureUser.topAnchor.constraint(equalTo: infoStackView.topAnchor),
            pictureUser.leadingAnchor.constraint(equalTo: infoStackView.leadingAnchor),
            
            signOutButton.heightAnchor.constraint(equalToConstant: 56),
            signOutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signOutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            signOutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19),
            signOutButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -90),
            
            termsConditionsButton.heightAnchor.constraint(equalToConstant: 56),
            termsConditionsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            termsConditionsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            termsConditionsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19),
            termsConditionsButton.bottomAnchor.constraint(equalTo: signOutButton.topAnchor, constant: -28),
            
            languageButton.heightAnchor.constraint(equalToConstant: 56),
            languageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            languageButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            languageButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19),
            languageButton.topAnchor.constraint(equalTo: pictureUser.bottomAnchor, constant: 44),

        ])
    }

    // MARK: - Button Action
    
    @objc private func signoutButtonTapped() {
        let nextViewController = BrowseViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @objc private func termsConditionsButtonTapped() {
        let nextViewController = TermsViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @objc private func languageButtonTapped() {
        let nextViewController = LanguageViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }
 
}
