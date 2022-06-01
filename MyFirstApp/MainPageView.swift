import SwiftUI

struct MainPageView: View {
    @StateObject var articleData = ArticleData()
    
    var body: some View {
        TabView {
            HeadlineView(articles: articles)
                .task(id: articleData.lastFetchTime, loadArticles)
                .refreshable(action: refreshFetchTime)
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("Headlines")
                }
            
            ContactsView().environmentObject(Dialogues())
                .tabItem {
                    Image(systemName: "message")
                    Text("MyMessage")
                }
            
            ClockView()
                .tabItem {
                    Image(systemName: "clock")
                    Text("Clock")
                }
        }
    }
    
    private var articles: [Article] {
        if case let .success(articles) = articleData.fetchPhase {
            return articles
        } else {
            return []
        }
    }
    
    @Sendable
    private func loadArticles() async {
        await articleData.loadArticles()
    }
    
    @Sendable
    private func refreshFetchTime() async {
        articleData.lastFetchTime = Date()
    }
}

