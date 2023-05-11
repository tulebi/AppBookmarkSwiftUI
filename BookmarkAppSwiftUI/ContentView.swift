//
//  ContentView.swift
//  FullAppBookmark
//
//  Created by Тулеби Берик on 19.04.2023.
//

import SwiftUI

struct ContentView: View {
    @Binding var screen: AppScreens
    var body: some View {
        VStack {
            Image("Image")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 395, height: 614)
                .ignoresSafeArea()
                .padding(6)
            ZStack(alignment: .top){
                Rectangle()
                    .fill(Color.black)
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 230)
                VStack(spacing: 24){
                    HStack{
                        Text("Save all interesting links in one app")
                            .foregroundColor(.white)
                            .font(.system(size: 36, weight: .bold))
                        Spacer()
                    }
                    .padding(.horizontal,16)
                    HStack{
                        Text("Let's start collecting")
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                            .frame( width: 358, height: 58)
                            .background(Color.white)
                            .cornerRadius(16)
                    }
                    .onTapGesture {
                        UserDefaults.standard.set(true, forKey: "isOnboardingSeen")
                        screen = .main
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(screen: .constant(.onBoarding))
    }
}
