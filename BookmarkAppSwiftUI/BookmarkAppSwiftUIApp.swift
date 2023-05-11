//
//  BookmarkAppSwiftUIApp.swift
//  BookmarkAppSwiftUI
//
//  Created by Тулеби Берик on 11.05.2023.
//

import SwiftUI

enum AppScreens
{
    case main
    case onBoarding
}

@main
struct FullAppBookmarkApp: App {
    @State var screen: AppScreens
    var isOnboradingSeen: Bool
    init() {
        self.isOnboradingSeen = UserDefaults.standard.object(forKey: "isOnboardingSeen") as? Bool ?? false
        
        switch isOnboradingSeen{
        case true:
            self.screen = .main
        case false:
            self.screen = .onBoarding
        }
    }
    var body: some Scene {
        WindowGroup {
            switch screen {
            case .main:
                Bookmark1()
            case .onBoarding:
                ContentView(screen: $screen)
            }
        }
    }
}
