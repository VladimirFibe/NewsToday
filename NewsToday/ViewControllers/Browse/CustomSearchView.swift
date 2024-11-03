//
//  CustomSearchView.swift
//  NewsToday
//
//  Created by Vika on 27.10.24.
//

import UIKit

class CustomSearchView: UIView {
    
    let mainTextField = UITextField()
    let titleLabel = UILabel()
    let searchIcon = UIImageView()
    
    var text: String? {
        get { mainTextField.text }
        set { mainTextField.text = newValue }
    }
    
    var delegate: UITextFieldDelegate? {
        get { mainTextField.delegate }
        set { mainTextField.delegate = newValue }
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        configureView()
        configureMainTextField()
        configureSearchIcon()
        
        mainTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        titleLabel.isHidden = !textField.text!.isEmpty
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        backgroundColor = UIColor(named: "GrayLight")
        layer.cornerRadius = 12
        clipsToBounds = true
    }
    
    private func configureSearchIcon() {
            searchIcon.image = UIImage(named: "search")
            searchIcon.contentMode = .scaleAspectFit

            addSubview(searchIcon)

            searchIcon.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                searchIcon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
                searchIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                searchIcon.widthAnchor.constraint(equalToConstant: 24),
                searchIcon.heightAnchor.constraint(equalToConstant: 24)
            ])
    }
    
    private func configureMainTextField() {
        mainTextField.placeholder = "Search"
        mainTextField.backgroundColor = .clear
        mainTextField.borderStyle = .none
        mainTextField.font = UIFont(name: "Inter-Medium", size: 16)
        mainTextField.textColor = UIColor(named: "GreyPrimary")
        
        // Отступ слева для изображения
        mainTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 0))
        mainTextField.leftViewMode = .always
        mainTextField.returnKeyType = .done
        
        addSubview(mainTextField)
        
        mainTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            mainTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            mainTextField.topAnchor.constraint(equalTo: self.topAnchor),
            mainTextField.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
