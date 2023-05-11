//
//  BlackButton.swift
//  FullAppBookmark
//
//  Created by Тулеби Берик on 19.04.2023.
//

import SwiftUI

struct BlackButton: View {
    @Binding var callAlert: Bool
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.black)
            Text("Add bookmark")
                .foregroundColor(.white)
                .fontWeight(.semibold)
        }
        .frame( width: 358, height: 58)
        .padding(.bottom,36)
        .ignoresSafeArea()
        .onTapGesture {
            callAlert = true
        }
    }
}

struct BlackButton_Previews: PreviewProvider {
    static var previews: some View {
        BlackButton(callAlert: .constant(false))
    }
}
