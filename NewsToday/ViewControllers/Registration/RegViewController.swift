//
//  RegViewController.swift
//  NewsToday
//
//  Created by Надежда Капацина on 29.10.2024.
//

import UIKit

class RegViewController: UIViewController {

    private let signUpView = SignUpView()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupSighnUpView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        

    }
   
    
    func setupSighnUpView() {
        signUpView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signUpView)
        
        NSLayoutConstraint.activate([
            signUpView.topAnchor.constraint(equalTo: view.topAnchor),
            signUpView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            signUpView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            signUpView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
        
    }
}
