//
//  BrowseViewController.swift
//  NewToday
//
//  Created by Vika on 25.10.24.
//

import UIKit

class BrowseViewController: UIViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupHeaderView()
    }
    
    private func setupHeaderView() {
            // Используем расширение для добавления хедера
            view.addHeader(
                title: "Browse",
                subTitle: "Discover things of this world"
            )
        }
}
