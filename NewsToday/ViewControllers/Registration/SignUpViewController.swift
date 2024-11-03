//
//  SignUpViewController.swift
//  NewsToday
//
//  Created by Надежда Капацина on 31.10.2024.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SignUpViewController: UIViewController {
    var action: Callback?
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
    
    private let symbolView: UIView = {
        let openCloseParol: UIButton = {
            let element = UIButton(type: .custom)
            element.setImage(UIImage(systemName: "eye"), for: .normal)
            element.frame = CGRect(x: 20, y: 10, width: 25, height: 25)
            element.addTarget(
                SignUpViewController.self,
                action: #selector(togglePasswordVisibility),
                for: .touchUpInside)
            return element
        }()
        
        let iconContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 45))
        iconContainerView.addSubview(openCloseParol)
        return iconContainerView
    }()
    
    private let symbolTwoView: UIView = {
        let openCloseParol: UIButton = {
            let element = UIButton(type: .custom)
            element.setImage(UIImage(systemName: "eye"), for: .normal)
            element.frame = CGRect(x: 20, y: 10, width: 25, height: 25)
            element.addTarget(
                SignUpViewController.self,
                action: #selector(togglePasswordVisibility),
                for: .touchUpInside)
            return element
        }()
        
        let iconContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 45))
        iconContainerView.addSubview(openCloseParol)
        return iconContainerView
    }()
    //    private var haveAccountTextView: UITextView {
    //        let attributedString = NSMutableAttributedString(string: "Already have an account? Sign In")
    //        attributedString.addAttribute(.link, value: "https://www.example.com", range: (attributedString.string as NSString).range(of: "Sign In"))
    //        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 16), range: NSRange(location: 0, length: attributedString.length))
    //
    //        let textView = UITextView()
    //        textView.linkTextAttributes = [.font: UIFont(name: "Inter-Medium", size: 16)!]
    //        textView.backgroundColor = .clear
    //        textView.attributedText = attributedString
    //        textView.textColor = .black
    //        textView.isSelectable = true
    //        textView.isEditable = false
    //        textView.isScrollEnabled = false
    //        textView.delaysContentTouches = false
    //        textView.translatesAutoresizingMaskIntoConstraints = false
    //
    //
    //        return textView
    //    }
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupView()
        
    }
    
    func setupView() {
        view.addHeader(title: "Welcome to NewsToDay", subTitle: "Hello, guess you are new around here. You can start using the application after sign up ")
        
        setupStackView()
        
        
        passwordTextField.isSecureTextEntry = true
        passwordTextField.rightView = symbolView
        passwordTextField.rightViewMode = .always
        
        repeatPasswordTextField.isSecureTextEntry = true
        repeatPasswordTextField.rightView = symbolTwoView
        repeatPasswordTextField.rightViewMode = .always
        
        setButtons()
        
        // view.addSubview(haveAccountTextView)
        
        NSLayoutConstraint.activate([
            //            haveAccountTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            //            haveAccountTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            //            haveAccountTextView.
            
        ])
    }
    
    func setupStackView() {
        view.addSubview(stackView)
        [userTextField, emailTextField, passwordTextField, repeatPasswordTextField, sighnUpButton].forEach
        {stackView.addArrangedSubview($0) }
        
        sighnUpButton.tintColor = UIColor(named: "purplePrimary")
        sighnUpButton.setTitleColor(.white, for: .normal)
        
        
        
        
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            sighnUpButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
        ])
        
        
    }
    private func setButtons() {
        sighnUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        
    }
    
    @objc func togglePasswordVisibility(sender: UIButton) {
        passwordTextField.isSecureTextEntry.toggle()
    }
    
    @objc
    private func signUpButtonTapped() {
        print(#function)
        guard let email = emailTextField.text,
                let password = passwordTextField.text,
              let name = userTextField.text
        else  { return }
        print(email, password, name)
        Auth.auth().createUser(withEmail: email, password: password) {[weak self] result, error in
            guard error == nil, let result else { return }
            let person = Person(id: result.user.uid, name: name, email: email)
            try? Firestore.firestore().collection("persons").document(result.user.uid).setData(from: person) { error in
                self?.action?()
            }
        }
    }
    
}

