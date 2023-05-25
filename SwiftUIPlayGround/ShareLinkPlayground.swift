//
//  ShareLinkPlayground.swift
//  SwiftUIPlayGround
//
//  Created by Ahmed Ali on 25/05/2023.
//

import SwiftUI

/*
 ShareLink: View that controls sharing presentation (Introduced in iOS 16.0).
 When users tap on share link, it presents a share sheet for users to share content to other apps.
 
 Sharelink can share any data/content that conforms to a transferable protocol.
 
 All of these already conform to the transferable protocol.
 - String
 - Data
 - URL
 - Attributed String
 - Image
 
 */

struct CustomImage: Transferable {
    let image: Image
    let caption: String
    let description: String
    
    static var transferRepresentation: some TransferRepresentation {
        ProxyRepresentation(exporting: \.image)
    }
}

struct ShareLinkPlayground: View {
    let url = URL(string: "http://www.google.com")
    let image = Image("Nature")
    
    let customImage = CustomImage(
        image: Image("Nature"),
        caption: "Nature Image",
        description: "Nice nature image"
    )
    
    var body: some View {
        VStack {
            
            // string/text
//            ShareLink(item: "Good Morning!")
//
//            // title, URL
//            ShareLink("Visit Google.com", item: url!)
//
//            ShareLink(item: url!) {
//                Text("Custom title")
//                    .foregroundColor(.green)
//                    .font(.largeTitle)
//            }
//
//            ShareLink(item: url!, subject: Text("Custom title/subject"), message: Text("Description"))
            
            ShareLink(item: image, preview: SharePreview("Nature Image", image: image))
            
            ShareLink(item: customImage, preview: SharePreview(customImage.caption, image: customImage.image))
            
        }
    }
}

struct ShareLinkPlayground_Previews: PreviewProvider {
    static var previews: some View {
        ShareLinkPlayground()
    }
}
