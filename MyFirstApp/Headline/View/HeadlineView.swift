import SwiftUI

struct HeadlineView: View {
    let articles: [Article]
    
    var body: some View {
        NavigationView {
            List(articles) { article in
                ZStack {
                    NavigationLink(destination: ArticleView(article: article)) {}
                    ArticleRowView(article: article)
                }
            }
            .listStyle(.inset)
            .navigationBarTitle("Today's Headline", displayMode: .inline)
        }
    }
}
