//
//  RatingView.swift
//  AbonsShoppy_e-commerce_ios_App
//
//  Created by Ezgi Karahan on 25.07.2024.
//

import SwiftUI

struct RatingView: View {
    let rating: Double
    let maxRating: Int
    
    var body: some View {
            HStack(spacing: 3) {
                starsView()
                    
            }
            .font(.system(size: 12))
    }

    private func starsView() -> some View {
            
                ForEach(0..<maxRating) { index in
                    Image(systemName: index < Int(rating) ? "star.fill" : "star")
                        .foregroundColor(index < Int(rating) ? .yellow : .gray)
                }
            }
    }
    
struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: 4.5, maxRating: 5)
    }
}
