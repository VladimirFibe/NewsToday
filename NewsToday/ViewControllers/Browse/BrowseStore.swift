//
//  BrowseStore.swift
//  NewsToday
//
//  Created by Vladimir Fibe on 03.11.2024.
//

import Foundation
//import Combine

enum BrowseEvent {
    case didLoadSections([News])
    case didLoadCategory([News])
    case didLoadKeywords([News])
}

enum BrowseAction {
    case fetch
    case fetchByCategory(String)
    case fetchNewsByKeyword(String)
}

final class BrowseStore: Store<BrowseEvent, BrowseAction> {
    
    override func handleActions(action: BrowseAction) {
        switch action {
        case .fetch:
            statefulCall(fetch)
        case .fetchByCategory(let category):
            statefulCall {
                try await self.fetchBy(category: category)
            }
        case .fetchNewsByKeyword(let keyword):
            statefulCall {
                try await self.fetchBy(keyword: keyword)
            }
        }
    }
    
    private func fetch() async throws {
        let response: NewsResponse = try await APIClient.shared.request(.getNews)
        sendEvent(.didLoadSections(response.articles))
    }
    
    private func fetchBy(category: String) async throws {
        let response: NewsResponse = try await APIClient.shared.request(.getNewsByCategory(category))
        sendEvent(.didLoadCategory(response.articles))
    }
    
    private func fetchBy(keyword: String) async throws {
        let response: NewsResponse = try await APIClient.shared.request(.getNewsByKeyword(keyword))
        sendEvent(.didLoadKeywords(response.articles))
    }
}
