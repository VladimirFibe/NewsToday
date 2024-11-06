//
//  BookMakrs.swift
//  NewsToday
//
//  Created by Vladimir Fibe on 06.11.2024.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

final class BookMakrs {
    static var shared = BookMakrs()
    private init() {}
    var bookmarks: [News] = []
    
    func toggleStatus(for news: News) -> Bool {
        if let index = bookmarks.firstIndex(where: {$0.url == news.url}) {
            bookmarks.remove(at: index)
            return false
        } else {
            bookmarks.append(news)
            return true
        }
    }
    
    func isInBookMark(news: News) -> Bool {
        return bookmarks.firstIndex(where: {$0.url == news.url}) != nil
    }
        
    func fetchBookmarks() async throws -> [News] {
        guard let id = Auth.auth().currentUser?.uid else { return [] }
        let query = try await Firestore.firestore().collection("bookmarks")
            .limit(to: 50).getDocuments()
        return query.documents.compactMap { try? $0.data(as: News.self)}
    }
}
