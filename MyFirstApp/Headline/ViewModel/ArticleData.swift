import Foundation

enum FetchPhase<T> {
    case empty
    case success(T)
    case failure(Error)
}


@MainActor
class ArticleData: ObservableObject {
    @Published var fetchPhase = FetchPhase<[Article]>.empty
    @Published var lastFetchTime: Date
    private let newsAPI = NewsAPI.shared
    
    init(articles: [Article]? = nil) {
        if let articles = articles {
            self.fetchPhase = .success(articles)
        } else {
            self.fetchPhase = .empty
        }
        self.lastFetchTime = Date()
    }
    
    func loadArticles() async {
        self.fetchPhase = .empty
        do {
            let articles = try await newsAPI.fetchArticles()
            self.fetchPhase = .success(articles)
        } catch {
            print(error.localizedDescription)
            self.fetchPhase = .failure(error)
        }
    }
}
