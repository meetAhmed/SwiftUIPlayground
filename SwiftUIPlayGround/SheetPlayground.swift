//
//  SheetPlayground.swift
//  SwiftUIPlayGround
//
//  Created by Ahmed Ali on 09/05/2023.
//

import SwiftUI

// Present new view over existing one, and allows user to drag down to dismiss view.

// @Environment: Property wrapper that reads a value from view's environment.
// Examples: Device Locale, Device Dark/Light Mode etc.

// @Environment(\.presentationMode): iOS 14 or below: Indication whether view is currently presented by another view.

// @Environment(\.dismiss): iOS 15 or later: An action that dismiss current presentation.

struct Article: Identifiable {
    let id = UUID().uuidString
    let title: String
    let description: String
}

struct SheetPlayground: View {
//    @State private var isSheetVisible = false
    @State private var article: Article? = nil
    
    var body: some View {
        Button("Show Sheet") {
            article = Article(title: "How to use Sheet In SwiftUI?", description: "Some description")
//            isSheetVisible.toggle()
        }
        .buttonStyle(.borderedProminent)
//        .sheet(isPresented: $isSheetVisible) {
//            DetailView()
//        }
        .sheet(item: $article) { article in
            DetailView(article: article)
        }
    }
}

struct DetailView: View {
    var article: Article
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text(article.title)
            Text(article.description)
            
            Button("Dismiss Sheet") {
//                presentationMode.wrappedValue.dismiss()
                dismiss()
            }
            .buttonStyle(.borderedProminent)
            
        }
    }
}

struct SheetPlayground_Previews: PreviewProvider {
    static var previews: some View {
        SheetPlayground()
    }
}
