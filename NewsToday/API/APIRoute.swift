//
//  APIRoute.swift
//  NewsToday
//
//  Created by Vladimir Fibe on 20.10.2024.
//

import Foundation

enum APIRoute {
    
    case getNews
    
    case getNewsByCategory(String)
    
    case getNewsByKeyword(String)
    
    var baseUrl: String {
        "https://newsapi.org/v2/"
    }
    
    var fullUrl: String {

        switch self {
            
        case .getNews:
            return "\(baseUrl)top-headlines?country=us&apiKey=\(apiKey)"
        case .getNewsByCategory(let category):
            return "\(baseUrl)top-headlines?country=us&category=\(category)&apiKey=\(apiKey)"
        case .getNewsByKeyword(let keyword):
            return "\(baseUrl)top-headlines?q=\(keyword)&apiKey=\(apiKey)"
        }
    }
//    GET https://newsapi.org/v2/top-headlines?q=trump&apiKey=3f294b33ee144dcf9a4ed93c0f7bf1dd

    
    var apiKey: String {
        "9e72db7ad0a84a2597eefbb6690a48ac"
    }
    
    var httpMethod: String {
        "GET"
    }
    
    var request: URLRequest? {
        guard let url = URL(string: fullUrl) else { return nil }
        print(url)
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        request.timeoutInterval = 10
        return request
    }
}
