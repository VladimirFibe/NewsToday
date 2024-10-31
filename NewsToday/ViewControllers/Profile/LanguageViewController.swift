//
//  LanguageViewController.swift
//  NewToday
//
//  Created by Александр Гуркин on 24.10.2024.
//

import UIKit

class LanguageViewController: UIViewController {

    //    MARK: - UI Elements

    let imageButton = "check"
    let tittleEng = "English"
    let tittleRus = "Russian"
    var selectedButton: UIButton?
    var isSelected = true
   
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
    
    private lazy var engButton = UIButton(title: tittleEng, image: imageButton)
    private lazy var rusButton = UIButton(title: tittleRus, image: imageButton)
    
    @objc func englishButtonTapped() {
        if !engButton.isSelected {
            engButton.isSelected = true
            isSelected = engButton.isSelected
            rusButton.isSelected = false
        }
        UserDefaults.standard.set(isSelected, forKey: "selectedLanguage")
    }
    
    @objc func russianButtonTapped() {
        if !rusButton.isSelected {
            rusButton.isSelected = true
            engButton.isSelected = false
            isSelected = engButton.isSelected
        }
        UserDefaults.standard.set(isSelected, forKey: "selectedLanguage")
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
        view.backgroundView()
        view.addSubview(backButton)
        view.addButton(engButton)
        engButton.addTarget(self, action: #selector(englishButtonTapped), for: .touchUpInside)
        view.addButton(rusButton)
        rusButton.addTarget(self, action: #selector(russianButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            engButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            rusButton.topAnchor.constraint(equalTo: engButton.bottomAnchor, constant: 16),
        ])
    }
}

