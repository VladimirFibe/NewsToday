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
    
    static let shared = BrowseStore()
    
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
    
    
    //MARK: - save & delete bookmarks
    
    var bookmarkedNews: Set<String> = []
    var allNews: [News] = []
    
    func isBookmarked(_ news: News) -> Bool {
        guard let newsID = news.url else { return false }
        return bookmarkedNews.contains(newsID)
    }
    
    func toggleBookmark(for news: News) {
        guard let newsID = news.url else { return }
        if bookmarkedNews.contains(newsID) {
            bookmarkedNews.remove(newsID)
        } else {
            bookmarkedNews.insert(newsID)
        }
    }
    
    func fetchNewsByID(_ url: String) -> News? {
        return allNews.first(where: { $0.url == url })
    }
}
