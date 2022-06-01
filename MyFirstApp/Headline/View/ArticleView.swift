import SwiftUI

struct ArticleView: View {
    var article: Article
    
    var body: some View {
        ScrollView {
            Text(article.title)
                .font(.system(.title, design: .serif))
                .bold()
                .italic()
                .padding(.vertical)
            
            AsyncImage(url: URL(string: article.urlToImage!)) { phase in
                switch phase {
                case .empty:
                    HStack {
                        Spacer()
                        ProgressView()
                        Spacer()
                    }
                    
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .border(.gray, width: 5)
                        .shadow(radius: 5)
                    
                case .failure:
                    HStack {
                        Spacer()
                        VStack {
                            Image(systemName: "eye.trianglebadge.exclamationmark")
                                .imageScale(.large)
                            Text("Failed to fetch the online image.")
                        }
                        Spacer()
                    }
                    
                @unknown default:
                    fatalError()
                }
            }
            
            Text(article.content!)
                .font(.body)
                .padding(.vertical)
            
            Link("View Original Website", destination: URL(string: article.url)!)
                .padding()
        }
        .padding(.horizontal)
        .navigationTitle("Today's Headline")
        .navigationBarTitleDisplayMode(.inline)
    }
}
