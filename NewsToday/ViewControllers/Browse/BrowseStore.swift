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
}

enum BrowseAction {
    case fetch
    case fetchByCategory(String)
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
        }
    }
    
    private func fetch() async throws {
        let response: NewsResponse = try await APIClient.shared.request(.getNews)
        sendEvent(.didLoadSections(response.articles))
    }
    
    private func fetchBy(category: String) async throws {
        let response: NewsResponse = try await APIClient.shared.request(.getNewsByCategory(category))
        sendEvent(.didLoadSections(response.articles))
    }
}
