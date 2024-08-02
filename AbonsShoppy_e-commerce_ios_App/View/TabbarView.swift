//
//  TabbarView.swift
//  AbonsShoppy_e-commerce_ios_App
//
//  Created by Ezgi Karahan on 25.07.2024.
//

import SwiftUI

struct TabbarView: View {
    @Binding var selectedIndex: Int
    let tabItems: [(title: String, imageName: String)]
    
    var body: some View {
        HStack {
            ForEach(0..<tabItems.count, id: \.self) { index in
                Spacer()
                TabBarItem(title: tabItems[index].title,
                           imageName: tabItems[index].imageName,
                           isSelected: selectedIndex == index)
                    .onTapGesture {
                        selectedIndex = index
                    }
                Spacer()
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
        .padding(.horizontal)
    }
}

struct TabBarItem: View {
    let title: String
    let imageName: String
    let isSelected: Bool
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(isSelected ? .white : .blue)
            Text(title)
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(isSelected ? .white : .blue)
        }
        .padding()
        .background(isSelected ? Color.blue : Color.clear)
        .cornerRadius(10)
    }
}

struct TabbarView_Previews: PreviewProvider {
    
    @State static var selectedIndex = 0
    
    static var tabItems: [(title: String, imageName: String)] = [
            (title: "Home", imageName: "house"),
            (title: "Likes", imageName: "heart.fill"),
        ]
        
    static var previews: some View {
        TabbarView(selectedIndex: $selectedIndex, tabItems: tabItems)
    }
}
