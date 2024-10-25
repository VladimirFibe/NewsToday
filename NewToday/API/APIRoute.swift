//
//  APIRoute.swift
//  NewsToday
//
//  Created by Vladimir Fibe on 20.10.2024.
//

import Foundation

enum APIRoute {
    case getNews
    
    var baseUrl: String {
        "https://newsapi.org/v2/"
    }
    
    var fullUrl: String {
        "\(baseUrl)top-headlines?country=us&apiKey=\(apiKey)"
    }
    
    var apiKey: String {
        "9e72db7ad0a84a2597eefbb6690a48ac"
    }
    
    var httpMethod: String {
        "GET"
    }
    
    var request: URLRequest? {
        guard let url = URL(string: fullUrl) else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        request.timeoutInterval = 10
        return request
    }
}
