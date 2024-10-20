//
//  ViewController.swift
//  NewsToday
//
//  Created by Vladimir Fibe on 20.10.2024.
//

import UIKit

class BrowseViewController: UIViewController {
    private let store = BrowseStore()
    override func viewDidLoad() {
        super.viewDidLoad()
        store.sendAction(.fetch)
        view.backgroundColor = .red
    }
}

struct News: Decodable {
  let author: String?
  let title: String?
  let description: String?
  let urlToImage: String?
  let url: String?
}

struct NewsEnvelope: Decodable {
  let status: String
  let totalResults: Int
  let articles: [News]
}
