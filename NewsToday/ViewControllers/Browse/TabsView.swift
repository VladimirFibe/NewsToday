//
//  Untitled.swift
//  NewsToday
//
//  Created by Vika on 28.10.24.
//

import UIKit

protocol TabsViewDelegate: AnyObject {
    func tabsView(_ tabBarView: TabsView, didSelectTabAt index: Int)
}

class TabsView: UIView {
    
    weak var delegate: TabsViewDelegate?
    private var selectedButton: UIButton?
    private let buttonTitles: [String]
    private var buttons: [UIButton] = []
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    //
    init(buttonTitles: [String]) {
        self.buttonTitles = buttonTitles
        super.init(frame: .zero)
        setupButtons()
        setupScrollView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupScrollView() {
        addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setupButtons() {
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
//        stackView.distribution = .equalCentering
        stackView.spacing = 16
        
        scrollView.addSubview(stackView)
        addSubview(scrollView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])
        
        for (index, title) in buttonTitles.enumerated() {
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            button.backgroundColor = UIColor(named: "LightGray")
            button.setTitleColor(UIColor(named: "GreyPrimary"), for: .normal)
            button.titleLabel?.font = UIFont(name: "Inter-SemiBold", size: 12)
            button.layer.cornerRadius = 16
            button.widthAnchor.constraint(equalToConstant: 80).isActive = true
            button.tag = index
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            stackView.addArrangedSubview(button)
            buttons.append(button)
            
            // Устанавливаем первый таб выбранным по умолчанию
            if index == 0 {
                selectButton(button)
            }
        }
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        // Убираем выделение с предыдущей кнопки
        if let currentSelectedButton = selectedButton {
            deselectButton(currentSelectedButton)
        }
        
        // Выделяем выбранную кнопку
        selectButton(sender)
        delegate?.tabsView(self, didSelectTabAt: sender.tag)
    }
    
    private func selectButton(_ button: UIButton) {
        button.backgroundColor = UIColor(named: "brandPurple")
        button.setTitleColor(.white, for: .normal)
        selectedButton = button
    }
    
    private func deselectButton(_ button: UIButton) {
        button.backgroundColor = UIColor(named: "LightGray")
        button.setTitleColor(UIColor(named: "GreyPrimary"), for: .normal)
    }
}
