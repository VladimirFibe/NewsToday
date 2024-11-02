//
//  RegViewController.swift
//  NewsToday
//
//  Created by Надежда Капацина on 29.10.2024.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SignInViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    var action: Callback?
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
    
    private let symbolView: UIView = {
        let openCloseParol: UIButton = {
            let element = UIButton(type: .custom)
            element.setImage(UIImage(systemName: "eye"), for: .normal)
            element.frame = CGRect(x: 20, y: 10, width: 25, height: 25)
            element.addTarget(
                SignInViewController.self,
                action: #selector(togglePasswordVisibility),
                for: .touchUpInside)
            return element
        }()
        let iconContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 45))
        iconContainerView.addSubview(openCloseParol)
        return iconContainerView
    }()
    
    let sighnInButton = UIButton.createButton(title: "Sign In")
    
    let bottomLabel = UILabel.makeLabel(font: .systemFont(ofSize: 16), textColor: .black, numberOfLines: 0)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupView()
        passwordTextField.isSecureTextEntry = true
        passwordTextField.rightView = symbolView
        passwordTextField.rightViewMode = .always
        
    }
    
    func setupView() {
        view.addHeader(title: "Welcome Back 👋", subTitle: "I am happy to see you again. You can continue where you left off by logging in")
        view.addSubview(bottomLabel)
        setupStackView()
        setButtons()
        
        bottomLabel.text = "Don't have account? Sigh Up"
        
        
        
        let attributedString = NSMutableAttributedString(string: "Don't have account? ")
        let boldText = NSAttributedString(string: "Sign In", attributes: [.font: UIFont.boldSystemFont(ofSize: 16), .foregroundColor: UIColor.black])
        attributedString.append(boldText)
        
        bottomLabel.attributedText = attributedString
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        bottomLabel.isUserInteractionEnabled = true
        bottomLabel.addGestureRecognizer(tapGesture)
        
        NSLayoutConstraint.activate([
            bottomLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            bottomLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
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
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let updatedText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) {
            let blueColor = UIColor.systemBlue
            if let iconView = (textField.leftView)?.subviews.first as? UIImageView {
                iconView.tintColor = updatedText.isEmpty ? .lightGray : blueColor
            }
        }
        return true
    }
    
    private func setButtons() {
        sighnInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        
    }
    
    // MARK: Selector Methods
    
    @objc func togglePasswordVisibility(sender: UIButton) {
        passwordTextField.isSecureTextEntry.toggle()
    }
    
    @objc
    private func signInButtonTapped() {
        print(#function)
        guard let email = userTextField.text, let password = passwordTextField.text else  { return }
        Auth.auth().createUser(withEmail: email, password: password) {[weak self] result, error in
            guard error == nil, let result else { return }
            let person = Person(id: result.user.uid, name: "Vladimir", email: email)
            try? Firestore.firestore().collection("persons").document(result.user.uid).setData(from: person) { error in
                self?.action?()
            }
        }
    }
    @objc private func handleTap() {
        
        let signUpViewController = SignUpViewController()
        navigationController?.pushViewController(signUpViewController, animated: true)
    }
    
}
