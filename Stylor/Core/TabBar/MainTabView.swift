//
//  MainTabView.swift
//  Stylor
//
//  Created by Ali El Mufti on 06/07/2024.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            Text("Swiping View").tabItem { Image(systemName: "flame").tag(0) }
            Text("Search View").tabItem { Image(systemName: "magnifyingglass").tag(1) }
            Text("Inbox View").tabItem { Image(systemName: "bubble").tag(2) }
            Text("Profile View").tabItem { Image(systemName: "person").tag(3) }
        }   }
}

#Preview {
    MainTabView()
}
