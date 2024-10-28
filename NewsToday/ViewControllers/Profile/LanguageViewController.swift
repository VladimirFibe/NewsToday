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
    
    var button1Selected = true {
        didSet {
            name2Button.setNeedsUpdateConfiguration()
        }
    }
    
    private lazy var name1Button: UIButton = {
        let imageButton = UIImage(named: "check")
        var configuration = UIButton.Configuration.filled()
        configuration.title = "TEST1"
        configuration.attributedTitle?.font = UIFont(name: "Inter-SemiBold", size: 16)
        configuration.titleAlignment = .leading
        configuration.background.cornerRadius = 12
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 24, bottom: 16, trailing: 16)
        var handler: UIButton.ConfigurationUpdateHandler = { element in
            if element.state == .selected {
                element.configuration?.baseForegroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                element.configuration?.baseBackgroundColor = #colorLiteral(red: 0.2784313725, green: 0.3529411765, blue: 0.8431372549, alpha: 1)
                element.configuration?.image = imageButton
                element.configuration?.imagePlacement = .trailing
                element.configuration?.imagePadding = 200
                print("selected")
            } else {
                element.configuration?.baseForegroundColor = #colorLiteral(red: 0.4, green: 0.4235294118, blue: 0.5568627451, alpha: 1)
                element.configuration?.baseBackgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9568627451, blue: 0.9647058824, alpha: 1)
                element.configuration?.image = nil
                print("normal")
            }
        }

        let element = UIButton(configuration: configuration)
        element.isSelected = button1Selected
        element.configurationUpdateHandler = handler
        element.addTarget(self, action: #selector(name1ButtonTapped), for: .touchUpInside)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
        
    }()
    
    
    
    @objc func name1ButtonTapped(_ sender: UIButton) {
        if !sender.isSelected {
            sender.isSelected.toggle()
            button2Selected.toggle()
            
        }
           
//            UserDefaults.standard.set(sender.isSelected, forKey: "selectedLanguage")
    
    }
    
    var button2Selected: Bool = false {
        didSet {
            name1Button.setNeedsUpdateConfiguration()
        }
    }
    private lazy var name2Button: UIButton = {
        let imageButton = UIImage(named: "check")
        var configuration = UIButton.Configuration.filled()
        configuration.title = "TEST2"
        configuration.attributedTitle?.font = UIFont(name: "Inter-SemiBold", size: 16)
        configuration.titleAlignment = .leading
        configuration.background.cornerRadius = 12
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 24, bottom: 16, trailing: 16)

        var handler: UIButton.ConfigurationUpdateHandler = { element in
            if element.state == .selected {
                element.configuration?.baseForegroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                element.configuration?.baseBackgroundColor = #colorLiteral(red: 0.2784313725, green: 0.3529411765, blue: 0.8431372549, alpha: 1)
                element.configuration?.image = imageButton
                element.configuration?.imagePlacement = .trailing
                element.configuration?.imagePadding = 200
                print("selected")
            } else {
                element.configuration?.baseForegroundColor = #colorLiteral(red: 0.4, green: 0.4235294118, blue: 0.5568627451, alpha: 1)
                element.configuration?.baseBackgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9568627451, blue: 0.9647058824, alpha: 1)
                element.configuration?.image = nil
                print("normal")
            }
        
        }

        let element = UIButton(configuration: configuration)
        element.isSelected = button2Selected
        element.configurationUpdateHandler = handler
        element.addTarget(self, action: #selector(name2ButtonTapped), for: .touchUpInside)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
        
    }()

    
    @objc func name2ButtonTapped(_ sender: UIButton) {
        if !sender.isSelected {
            sender.isSelected.toggle()
            button1Selected.toggle()
        }
           
//            UserDefaults.standard.set(sender.isSelected, forKey: "selectedLanguage")
    
    }
    
    //        view.addSubview(element)
    //        NSLayoutConstraint.activate([
    //            element.heightAnchor.constraint(equalToConstant: 56),
    //            element.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
    //            element.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19),
    //            element.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    //        ])
    
    private lazy var englishButton: UIButton = {
        let imageButton = UIImage(named: "check")
        var configuration = UIButton.Configuration.filled()
        configuration.title = "English"
        configuration.attributedTitle?.font = UIFont(name: "Inter-SemiBold", size: 16)
        configuration.titleAlignment = .leading
        configuration.baseForegroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        configuration.background.cornerRadius = 12
        configuration.baseBackgroundColor = #colorLiteral(red: 0.2784313725, green: 0.3529411765, blue: 0.8431372549, alpha: 1)

        configuration.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 24, bottom: 16, trailing: 16)

        let element = UIButton(configuration: configuration)
        element.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        element.isSelected = false
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var russianButton: UIButton = {
        var tittleButton = "Russian"
        var configuration = UIButton.Configuration.filled()
        configuration.title = tittleButton
        configuration.attributedTitle?.font = UIFont(name: "Inter-SemiBold", size: 16)
        configuration.background.cornerRadius = 12
    
        let element = UIButton(configuration: configuration)
        element.isSelected = UserDefaults.standard.bool(forKey: "selectedLanguage")
        element.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    func changeButton(_ button: UIButton) {
        if button.isSelected {
            button.configuration?.titleAlignment = .leading
            button.configuration?.baseForegroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            button.configuration?.baseBackgroundColor = #colorLiteral(red: 0.2784313725, green: 0.3529411765, blue: 0.8431372549, alpha: 1)
            button.configuration?.image = imageButton
            button.configuration?.imagePlacement = .trailing
            button.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 24, bottom: 16, trailing: 16)
            if button.currentTitle == "Russian" {
                button.configuration?.imagePadding = 211
            } else {
                button.configuration?.imagePadding = 215
            }
        } else {
            button.configuration?.titleAlignment = .leading
            button.configuration?.baseForegroundColor = #colorLiteral(red: 0.4, green: 0.4235294118, blue: 0.5568627451, alpha: 1)
            button.configuration?.baseBackgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9568627451, blue: 0.9647058824, alpha: 1)
            if button.currentTitle == "Russian" {
                button.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 24, bottom: 16, trailing: 251)
            } else {
                button.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 24, bottom: 16, trailing: 274)
            }
        }
    }

    
    @objc func buttonTapped(_ sender: UIButton) {
        changeButton(sender)
        sender.isSelected.toggle()
        UserDefaults.standard.set(sender.isSelected, forKey: "selectedLanguage")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewsConstraints()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         navigationController?.navigationBar.isHidden = false
         navigationItem.title = "Language"
        
        navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 51/255, green: 54/255, blue: 71/255, alpha: 1), NSAttributedString.Key.font: UIFont.init(name: "Inter-SemiBold", size: 24)]
        
     }
    
    
    private func setupViewsConstraints() {
        view.addSubview(backgroundViewColor)
        view.addSubview(backButton)
        view.addSubview(englishButton)
        view.addSubview(russianButton)
        view.addSubview(name1Button)
        view.addSubview(name2Button)
        
        NSLayoutConstraint.activate([
            backgroundViewColor.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundViewColor.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundViewColor.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundViewColor.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            englishButton.heightAnchor.constraint(equalToConstant: 56),
            englishButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            englishButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19),
            englishButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            englishButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            
            russianButton.heightAnchor.constraint(equalToConstant: 56),
            russianButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            russianButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19),
            russianButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            russianButton.topAnchor.constraint(equalTo: englishButton.bottomAnchor, constant: 16),
            
            name1Button.heightAnchor.constraint(equalToConstant: 56),
            name1Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            name1Button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19),
            name1Button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            name1Button.topAnchor.constraint(equalTo: russianButton.bottomAnchor, constant: 16),
            
            name2Button.heightAnchor.constraint(equalToConstant: 56),
            name2Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            name2Button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19),
            name2Button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            name2Button.topAnchor.constraint(equalTo: name1Button.bottomAnchor, constant: 16),
        ])
    }

}

