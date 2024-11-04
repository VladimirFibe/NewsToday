//
//  News.swift
//  NewsToday
//
//  Created by Vladimir Fibe on 21.10.2024.
//

import Foundation

struct News: Decodable {
  var sourse: Sourse?
  var author: String?
  var title: String?
  var description: String?
  var urlToImage: String?
  var url: String?
  var category: NewsCategory?
}

struct NewsResponse: Decodable {
  let status: String
  let totalResults: Int
  let articles: [News]
}

struct Sourse: Codable {
    let id: String?
    let name: String?
}

enum NewsCategory: String, Codable, CaseIterable {
    case business
    case entertainment
    case general
    case health
    case science
    case sports
    case technology
    
    var title: String {
            return self.rawValue.capitalized
    }
}
