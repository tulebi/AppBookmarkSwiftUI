//
//  FirstAddingBookmark.swift
//  FullAppBookmark
//
//  Created by Тулеби Берик on 19.04.2023.
//

import SwiftUI

struct FirstAddingBookmark: View {
    var body: some View {
        VStack{
            Text("Bookmark App")
                .fontWeight(.bold)
                .padding(.top,50)
                .padding(.bottom,298)
            Text("Save your first \nbookmark")
                .multilineTextAlignment(.center)
                .font(.system(size: 36, weight: .bold))
        }
    }
}

struct FirstAddingBookmark_Previews: PreviewProvider {
    static var previews: some View {
        FirstAddingBookmark()
    }
}
