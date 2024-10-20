//
//  BrowseStore.swift
//  NewsToday
//
//  Created by Vladimir Fibe on 20.10.2024.
//

import Foundation

enum BrowseEvent {
    case done
}

enum BrowseAction {
    case fetch
}

final class BrowseStore: Store<BrowseEvent, BrowseAction> {
    override func handleActions(action: BrowseAction) {
        switch action {
        case .fetch:
            statefulCall {
                try await self.login()
            }
        }
    }
    
    private func login() async throws {
        let all: NewsEnvelope = try await APIClient.shared.request(.getNews)
        all.articles.forEach {
            print($0.title ?? "")
        }
    }
}
