//
//  ContentView.swift
//  AbonsShoppy_e-commerce_ios_App
//
//  Created by Ezgi Karahan on 24.07.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            HomeView()
                .tabItem{
                Image(systemName: "house.fill")
                    Text("Home")
                }
            LikesView()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Likes")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
