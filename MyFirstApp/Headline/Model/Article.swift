import Foundation

struct Headline: Decodable {
    var articles: [Article]
}

struct Article: Identifiable, Decodable {
    // id is required to conform the `Ideantifiable` protocol
    let id = UUID()
    
    // struct elements conform to newsapi.org example
    let source: Source
    let title: String
    let url: String
    let publishedAt: Date
    let author: String?
    let urlToImage: String?
    let content: String?
    
    enum CodingKeys: String, CodingKey {
        case source
        case title
        case url
        case publishedAt
        case author
        case urlToImage
        case content
    }
}

struct Source: Decodable {
    let name: String
}
