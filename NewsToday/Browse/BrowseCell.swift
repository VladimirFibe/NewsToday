//
//  BrowseCell.swift
//  NewsToday
//
//  Created by Vladimir Fibe on 21.10.2024.
//

import UIKit

final class BrowseCell: UITableViewCell {
    static let identifier = "BrowseCell"
    
    public func configure(with news: News) {
        textLabel?.text = news.title
    }
}
