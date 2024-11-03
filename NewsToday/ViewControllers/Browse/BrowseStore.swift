//
//  BrowseStore.swift
//  NewsToday
//
//  Created by Vladimir Fibe on 03.11.2024.
//

import Foundation
//import Combine

enum BrowseEvent {
    case didLoadSections
}

enum BrowseAction {
    case fetch
}

final class BrowseStore: Store<BrowseEvent, BrowseAction> {
    
    override func handleActions(action: BrowseAction) {
        switch action {
        case .fetch:
            statefulCall(fetch)
        }
    }
    
    private func fetch() async throws {
        let response: NewsResponse = try await APIClient.shared.request(.getNews)
        print("fetch news", response.articles.count)
    }
}
