//
//  Bookmark1.swift
//  FullAppBookmark
//
//  Created by Тулеби Берик on 19.04.2023.
//

import SwiftUI

struct Bookmark: Identifiable {
    let id = UUID()
    let title: String
    let link: String
}

class BookmarkManager: ObservableObject {
    @Published var bookmarks: [Bookmark] = []
    
    func addBookmark(title: String, link: String) {
        let bookmark = Bookmark(title: title, link: link)
        bookmarks.append(bookmark)
    }
    
    func removeBookmark(bookmark: Bookmark) {
        bookmarks.removeAll { $0.id == bookmark.id }
    }
    
}

struct Bookmark1: View {
    // @Binding var screen: AppScreens
    @ObservedObject var bookmarkManager = BookmarkManager()
    @State var callAlert: Bool = false
    @State var listView: Bool = false
    @State var newTitle = ""
    @State var newLink = ""
    @Environment(\.openURL) var openURL
    
    var body: some View {
        ZStack{
            switch callAlert{
            case true:
                if listView == false {
                    Color.gray.opacity(0.5)
                    .ignoresSafeArea()}
            case false:
                Color.white
            }
            VStack{
                switch listView{
                case true:
                    lists
                case false:
                    FirstAddingBookmark()
                }
                
                Spacer()
                switch callAlert{
                case true:
                    viewAlert
                case false:
                    BlackButton(callAlert: $callAlert)
                }
            }
            .ignoresSafeArea()
            
        }
    }
    
    var viewAlert: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(.white)
                .frame(height: 365)
            VStack{
                HStack{
                    Spacer()
                    Image("Image 1")
                        .resizable()
                        .frame( width: 12.01,height: 12.01)
                        .padding(.trailing,21.99)
                        .padding(.top,30)
                        .padding(.bottom,5)
                        .onTapGesture {
                            callAlert = false
                        }
                }
                HStack{
                    Text("Title")
                        .padding(.leading,16)
                        .padding(.bottom,12)
                    
                    Spacer()
                }
                TextField("Bookmark title", text:
                            $newTitle)
                .padding()
                .background(RoundedRectangle(cornerRadius: 16).fill(Color.gray).opacity(0.2))
                .padding(.horizontal,16)
                
                HStack{Text("Link")
                        .padding(.leading,16)
                        .padding(.bottom,10)
                        .padding(.top,12)
                    Spacer()
                }
                TextField("Bookmark link(URL)", text: $newLink)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 16).fill(Color.gray).opacity(0.2))
                    .padding(.horizontal,16)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.black)
                    Text("Save")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
                .frame( width: 358, height: 58)
                .padding(.bottom,50)
                .padding(.top,24)
                .onTapGesture{
                    saveBookmark()
                    listView = true
                    callAlert = false
                }
                .disabled(newTitle.isEmpty || newLink.isEmpty)
                Spacer()
            }
        }
        .frame(height: 365)
    }
    
    var lists: some View{
        VStack{
            Text("List")
                .fontWeight(.medium)
            List {
                ForEach(bookmarkManager.bookmarks) { bookmark in
                    VStack(alignment: .leading,spacing: 20) {
                        HStack{
                            Text(bookmark.title)
                            Spacer()
                            Image("square")
                        }
                        .onTapGesture {
                            openURL(URL(string: bookmark.link)!)
                        }
                    }
                    .padding(.vertical,10)
                    .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                        Button("Delete", role: .destructive) {
                            removeBookmark(bookmark: bookmark)
                        }
                    }
                }
            }
                    .listStyle(InsetListStyle())
                }
                .padding(.top,56)
            }
            func saveBookmark() {
                bookmarkManager.addBookmark(title: newTitle, link: newLink)
                newTitle = ""
                newLink = ""
            }
            
            func removeBookmark(bookmark: Bookmark) {
                bookmarkManager.removeBookmark(bookmark: bookmark)
            }
        }
        
        struct Bookmark1_Previews: PreviewProvider {
            static var previews: some View {
                Bookmark1()
            }
        }
