//
//  LikesView.swift
//  AbonsShoppy_e-commerce_ios_App
//
//  Created by Ezgi Karahan on 24.07.2024.
//

import SwiftUI

struct LikesView: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("Likes")
                    .font(.largeTitle)
                    .padding()
            }
        }.navigationTitle("Likes")
    }
}

struct LikesView_Previews: PreviewProvider {
    static var previews: some View {
        LikesView()
    }
}
