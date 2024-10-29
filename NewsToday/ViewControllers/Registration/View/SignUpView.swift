//
//  SignUp.swift
//  NewsToday
//
//  Created by Надежда Капацина on 29.10.2024.
//

import UIKit

class SignUpView: UIView {
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        self.addHeader(title: "Welcome to NewsToDay", subTitle: "Hello, guess you are new around here. You can start using the application after sign up ")
        
    }
    }

