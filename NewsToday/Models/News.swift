//
//  News.swift
//  NewsToday
//
//  Created by Vladimir Fibe on 21.10.2024.
//

import Foundation

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
