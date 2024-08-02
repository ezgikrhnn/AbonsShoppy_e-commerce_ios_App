//
//  ProductDetailView.swift
//  AbonsShoppy_e-commerce_ios_App
//
//  Created by Ezgi Karahan on 24.07.2024.
//

import SwiftUI

struct ProductDetailView: View {
    
    var product: Product
        
        var body: some View {
            VStack {
                AsyncImage(url: URL(string: product.image)) { image in
                    image
                    .resizable()
                    .aspectRatio(contentMode: .fit) // Resmi oranını koru, çerçeveye uydur
                    .frame(maxWidth: .infinity, maxHeight: 300) // Maksimum sınırlar
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                } placeholder: {
                    ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                }
                .padding() // Resmin etrafına boşluk
                
                Text(product.title)
                    .font(.largeTitle)
                    .padding()
                
                Text("\(product.price, specifier: "%.2f")$")
                    .font(.title)
                    .padding()
                
                Text(product.description)
                    .font(.body)
                    .padding()
                
                Spacer()
            }
            .navigationTitle(product.title)
            .navigationBarTitleDisplayMode(.inline)
    }
}


struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: Product(id: 1, title: "Test Product", price: 99.99, description: "This is a test product description.", category: "test", image: "https://via.placeholder.com/150", rating: Product.Rating(rate: 3.2, count: 100)))
    }
}

