//
//  ProductCellView.swift
//  AbonsShoppy_e-commerce_ios_App
//
//  Created by Ezgi Karahan on 25.07.2024.
//

import SwiftUI

struct ProductCellView: View {
    
    var product: Product
    
    @State private var isLiked: Bool = false // Beğeni durumu
    
    var body: some View {
            VStack(alignment: .leading, spacing: 10) {
                
                AsyncImage(url: URL(string: product.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    Color.gray
                }
                .frame(width: 180, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.top, 10)
        
                Text(product.title)
                    .font(.system(size: 14))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .frame(width: 150, alignment: .leading)
                    .padding(.leading, 10)
                    .padding(.bottom, 8)
              
                
                HStack {
                    VStack(alignment: .leading){
                        RatingView(rating: product.rating.rate, maxRating: 5)
                            .padding(.leading, 10)
                        
                        Text("\(product.price, specifier: "%.2f")$")
                            .font(.subheadline)
                            .foregroundColor(Color("DarkBlue"))
                            .frame(alignment: .leading)
                            .padding(.leading, 10)
                    }
                    Spacer()
                    Button(action: {
                            isLiked.toggle() // Beğenme durumunu değiştir
                        }) {
                            Image(systemName: isLiked ? "heart.fill" : "heart")
                                .foregroundColor(isLiked ? .red : .gray)
                                .padding(10)
                                .background(Color("DarkBlue")) // Arka plan rengi
                                .clipShape(Circle()) // Butonu yuvarlak yapmak için
                                .shadow(radius: 5) // Gölge eklemek için
                        }
                }.frame(width: 180)
                
        }.padding(.top, 10)
        .padding(.leading, 10)
        .padding(.trailing, 10)
        .frame(width: 180, height: 300)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 5)
    }
}

struct ProductCellView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCellView(product: Product(id: 1, title: "Test Product", price: 99.99, description: "This is a test product description.", category: "test", image: "https://via.placeholder.com/150", rating: Product.Rating(rate: 4.5, count: 100)))
    }
}
