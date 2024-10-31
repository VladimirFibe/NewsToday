//
//  RegViewController.swift
//  NewsToday
//
//  Created by Надежда Капацина on 29.10.2024.
//

import UIKit

class SignInViewController: UIViewController {
    
    var signUpVC = SignUpViewController()
    
    private let stackView: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.spacing = 15
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    let userTextField = UITextField.makeTextField(placeholder: "Username", image: UIImage(named: "user")!)
    
    
    let passwordTextField = UITextField.makeTextField(placeholder: "Password", image: UIImage(systemName: "lock")!)

    let sighnInButton = UIButton.createButton(title: "Sign In")
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupView()
        
    }
    
    func setupView() {
        view.addHeader(title: "Welcome Back 👋", subTitle: "I am happy to see you again. You can continue where you left off by logging in")
        
        setupStackView()
        // view.addSubview(haveAccountTextView)
        
        NSLayoutConstraint.activate([
            //            haveAccountTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            //            haveAccountTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            //            haveAccountTextView.
            
        ])
    }
    
    func setupStackView() {
        view.addSubview(stackView)
        [userTextField, passwordTextField,  sighnInButton].forEach
        {stackView.addArrangedSubview($0) }
        
        sighnInButton.tintColor = UIColor(named: "purplePrimary")
        sighnInButton.setTitleColor(.white, for: .normal)
        
        
        
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            sighnInButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
        ])
        
        
    }
}
