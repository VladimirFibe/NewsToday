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
    
    
//    func changeButton(_ button: UIButton) {
//        if button.isSelected {
//            button.configuration?.titleAlignment = .leading
//            button.configuration?.baseForegroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//            button.configuration?.baseBackgroundColor = #colorLiteral(red: 0.2784313725, green: 0.3529411765, blue: 0.8431372549, alpha: 1)
//            button.configuration?.image = imageButton
//            button.configuration?.imagePlacement = .trailing
//            button.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 24, bottom: 16, trailing: 16)
//            if button.currentTitle == "Russian" {
//                button.configuration?.imagePadding = 211
//            } else {
//                button.configuration?.imagePadding = 215
//            }
//        } else {
//            button.configuration?.titleAlignment = .leading
//            button.configuration?.baseForegroundColor = #colorLiteral(red: 0.4, green: 0.4235294118, blue: 0.5568627451, alpha: 1)
//            button.configuration?.baseBackgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9568627451, blue: 0.9647058824, alpha: 1)
//            if button.currentTitle == "Russian" {
//                button.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 24, bottom: 16, trailing: 251)
//            } else {
//                button.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 24, bottom: 16, trailing: 274)
//            }
//        }
//    }

    @objc func buttonTapped(_ sender: UIButton) {
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
        view.backgroundView()
        view.addSubview(backButton)
        view.addButton(engButton)
        engButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.addButton(rusButton)
        rusButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    
        NSLayoutConstraint.activate([
            engButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            rusButton.topAnchor.constraint(equalTo: engButton.bottomAnchor, constant: 16),
        ])
    }

}

