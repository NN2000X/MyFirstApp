import Foundation

struct NewsAPI {
    private let session = URLSession.shared
    static let shared = NewsAPI()
    
    private init() {}
    
    func fetchArticles() async throws -> [Article] {
        let (data, response) = try await session.data(from: URL(string: "https://newsapi.org/v2/top-headlines?apiKey=87dc03dceba14055a57cf13aeab12d3a&sources=the-wall-street-journal")!)
        
        guard let response = response as? HTTPURLResponse else {
            throw NSError(domain: "NewsAPI", code: 1, userInfo: [NSLocalizedDescriptionKey: "No responses."])
        }
        
        switch response.statusCode {
        case (200...299), (400...499):
            let decoder = getJSONDecoder()
            let apiResponse = try decoder.decode(NewsAPIResponse.self, from: data)
            if apiResponse.status == "ok" {
                return apiResponse.articles ?? []
            } else {
                throw NSError(domain: "NewsAPI", code: 1, userInfo: [NSLocalizedDescriptionKey: apiResponse.message ?? "An unknown error occured."])
            }
        default:
            throw NSError(domain: "NewsAPI", code: 1, userInfo: [NSLocalizedDescriptionKey: "A server error occured."])
        }
    }
}

struct NewsAPIResponse: Decodable {
    let status: String
    let totalResults: Int?
    let articles: [Article]?
    let code: String?
    let message: String?
}
