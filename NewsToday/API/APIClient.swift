//
//  APIClient.swift
//  NewsToday
//
//  Created by Vladimir Fibe on 20.10.2024.
//

import Foundation

final class APIClient {
    static let shared = APIClient()
    private init() {}
    
    func request<Response: Decodable>(_ route: APIRoute) async throws -> Response {
        guard let request = route.request else { throw APIError.failedRequest}
        let (data, _) = try await URLSession.shared.data(for: request)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let result = try? decoder.decode(Response.self, from: data)
        else { throw APIError.failedTogetData }
        return result
    }
}
