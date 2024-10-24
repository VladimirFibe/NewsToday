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
        element.distribution = .fillEqually
        element.backgroundColor = .white
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
        element.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        element.textAlignment = .left
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    
    private lazy var nameLabel: UILabel = {
        let element = UILabel()
        element.text = "Dev P"
        element.textColor = UIColor(red: 51/255, green: 54/255, blue: 71/255, alpha: 1)
        element.font = UIFont(name: "Intel", size: 16)
        element.textAlignment = .left
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var mailLabel: UILabel = {
        let element = UILabel()
        element.text = "dev@gmail.com"
        element.textColor = UIColor(red: 124/255, green: 130/255, blue: 161/255, alpha: 1)
        element.font = UIFont(name: "Intel", size: 16)
        element.textAlignment = .left
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

//    private let rulesButton =  UIButton(name: "rulesIcon")
//    private let settingButton =  UIButton(name: "settingIcon")
//
    var configuration = UIButton.Configuration.filled()
   
    
    private lazy var signOutButton: UIButton = {
        let element = UIButton()
        element.backgroundColor = UIColor(red: 243/255, green: 244/255, blue: 246/255, alpha: 1)

        element.setTitle("Sign Out", for: .normal)
        element.titleLabel?.font = UIFont(name: "Intel", size: 16)
        element.setTitleColor(UIColor(red: 102/255, green: 108/255, blue: 142/255, alpha: 1), for: .normal)
        element.setImage(UIImage(named: "signout 1"), for: .normal)
    
        
        
        
//        var configuration = UIButton.Configuration.filled()
//        configuration.title = "Title"
//        configuration.subtitle = "Subtitle"
//        configuration.image = UIImage(systemName: "swift")
//        configuration.titlePadding = 10
//        configuration.imagePadding = 10
//        configuration.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 20, bottom: 2, trailing: 20)
        
        
        element.layer.cornerRadius = 12
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    //     MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setConstrains()
    }

    //     MARK: - UI Setup
    private func setView() {
        view.addSubview(backgroundViewColor)
        view.addSubview(mainLabel)
        view.addSubview(infoStackView)
        infoStackView.addArrangedSubview(pictureUser)
        infoStackView.addArrangedSubview(verticalStackView)
        
        verticalStackView.addArrangedSubview(nameLabel)
        verticalStackView.addArrangedSubview(mailLabel)
        
        view.addSubview(signOutButton)

//        rulesButton.addTarget(self, action: #selector(infoGameTapped), for: .touchUpInside)
//        settingButton.addTarget(self, action: #selector(settingButtonTapped), for: .touchUpInside)
//        actionButton.addTarget(self, action: #selector(startGameButton), for: .touchUpInside)

    }

    private func setConstrains() {

        NSLayoutConstraint.activate([
            backgroundViewColor.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundViewColor.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundViewColor.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundViewColor.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            mainLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 28),
            mainLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            infoStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 92),
            infoStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            infoStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            pictureUser.widthAnchor.constraint(equalToConstant: 72),
            pictureUser.heightAnchor.constraint(equalToConstant: 72),
            pictureUser.topAnchor.constraint(equalTo: infoStackView.topAnchor),
            pictureUser.leadingAnchor.constraint(equalTo: infoStackView.leadingAnchor),
            
            
            
            signOutButton.widthAnchor.constraint(equalToConstant: 336),
            signOutButton.heightAnchor.constraint(equalToConstant: 56),
            signOutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -1),
            signOutButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -90),
            
            
            
//            rulesButton.widthAnchor.constraint(equalToConstant: 36),
//            rulesButton.heightAnchor.constraint(equalToConstant: 36),
//            rulesButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  20),
//            rulesButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
//
//            settingButton.widthAnchor.constraint(equalToConstant: 36),
//            settingButton.heightAnchor.constraint(equalToConstant: 36),
//            settingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            settingButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
//
//            logoImageView.widthAnchor.constraint(equalToConstant: 270.07),
//            logoImageView.heightAnchor.constraint(equalToConstant: 135),
//            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0.03),
//            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 278),
//
//            titleLabel.centerXAnchor.constraint(equalTo: logoImageView.centerXAnchor, constant: -1),
//            titleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 31),
//
//            actionButton.widthAnchor.constraint(equalToConstant: 348),
//            actionButton.heightAnchor.constraint(equalToConstant: 72),
//            actionButton.centerXAnchor.constraint(equalTo: logoImageView.centerXAnchor, constant: 0),
//            actionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),

        ])
    }

    // MARK: - Button Action
//    @objc private func startGameButton() {
//        let nextViewController = SelectGameViewController()
//        navigationController?.pushViewController(nextViewController, animated: true)
//    }
//
//    @objc private func infoGameTapped() {
//        let nextViewController = PlayInfoViewController()
//        navigationController?.pushViewController(nextViewController, animated: true)
//    }
//
//    @objc private func settingButtonTapped() {
//        let nextViewController = SettingGameViewcontroller()
//        navigationController?.pushViewController(nextViewController, animated: true)
//    }
}
