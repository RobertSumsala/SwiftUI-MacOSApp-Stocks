//
//  Article.swift
//  Stocks
//
//  Created by Róbert Šumšala Jr. on 21/08/2024.
//

import Foundation

struct ArticleResponse: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String?
    let url: String?
    let urlToImage: String?
    var sourceName: String?
    
    private enum ArticleKeys: String, CodingKey {
        case title
        case url
        case urlToImage
        case source
    }
    
    private enum SourceKeys: String, CodingKey {
        case id
        case name
    }
    
    enum CodingKeys: CodingKey {
        case title
        case url
        case urlToImage
        case sourceName
    }
    
    init(from decoder: any Decoder) throws {
        let articleContainer = try decoder.container(keyedBy: ArticleKeys.self)
        self.title = try? articleContainer.decodeIfPresent(String.self, forKey: .title)
        self.url = try? articleContainer.decodeIfPresent(String.self, forKey: .url)
        self.urlToImage = try? articleContainer.decodeIfPresent(String.self, forKey: .urlToImage)
        
        if let sourceContainer = try? articleContainer.nestedContainer(keyedBy: SourceKeys.self, forKey: .source) {
            self.sourceName = try? sourceContainer.decodeIfPresent(String.self, forKey: .name)
        }
    }
    
}
