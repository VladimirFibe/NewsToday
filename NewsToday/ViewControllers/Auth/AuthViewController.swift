//
//  AuthViewController.swift
//  NewsToday
//
//  Created by Vladimir Fibe on 26.10.2024.
//

import UIKit

final class AuthViewController: UIViewController {
    var action: Callback?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Login", style: .done, target: self, action: #selector(login))
    }
    
    @objc private func login() {
        action?()
    }
}
