//
//  SignUp.swift
//  NewsToday
//
//  Created by Надежда Капацина on 29.10.2024.
//

import UIKit

class SignUpView: UIView {
    
    private let stackView: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.spacing = 15
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    let userTextField = UITextField.makeTextField(placeholder: "Username", image: UIImage(named: "user")!)
    
    let emailTextField = UITextField.makeTextField(placeholder: "Email Adress", image: UIImage(systemName: "envelope")!)
    
    let passwordTextField = UITextField.makeTextField(placeholder: "Password", image: UIImage(systemName: "lock")!)
    
    let repeatPasswordTextField = UITextField.makeTextField(placeholder: " Repeat Password", image: UIImage(systemName: "lock")!)

        
    let sighnUpButton = UIButton.createButton(title: "Sign Up")

    private let haveAccountTextView: UITextView = {
        let attributedString = NSMutableAttributedString(string: "Already have an account? Sign In")
        attributedString.addAttribute(.link, value: "https://www.example.com", range: (attributedString.string as NSString).range(of: "Sign In"))
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 16), range: NSRange(location: 0, length: attributedString.length))
        
        let textView = UITextView()
        textView.linkTextAttributes = [.font: UIFont(name: "Inter-Medium", size: 16)!]
        textView.backgroundColor = .clear
        textView.attributedText = attributedString
        textView.textColor = .black
        textView.isSelectable = true
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.delaysContentTouches = false
        textView.translatesAutoresizingMaskIntoConstraints = false


        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        self.addHeader(title: "Welcome to NewsToDay", subTitle: "Hello, guess you are new around here. You can start using the application after sign up ")
        
        
        setupStackView()
        self.addSubview(haveAccountTextView)
        
        NSLayoutConstraint.activate([
            haveAccountTextView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            haveAccountTextView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
  
        ])
 }
                                    
    func setupStackView() {
        self.addSubview(stackView)
        [userTextField, emailTextField, passwordTextField, repeatPasswordTextField, sighnUpButton].forEach
        {stackView.addArrangedSubview($0) }
        
        sighnUpButton.tintColor = UIColor(named: "purplePrimary")
        sighnUpButton.setTitleColor(.white, for: .normal)
        
        

        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 120),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            sighnUpButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
        ])
        
        
    }
    }

