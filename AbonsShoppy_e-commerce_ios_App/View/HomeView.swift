//
//  HomeView.swift
//  AbonsShoppy_e-commerce_ios_App
//
//  Created by Ezgi Karahan on 24.07.2024.
//
import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewViewModel()

    // Grid düzeni: her satırda iki hücre
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(viewModel.products) { product in
                        NavigationLink(destination: ProductDetailView(product: product)) {
                            ProductCell(product: product)
                                
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Products")
        }
        .onAppear {
            if viewModel.products.isEmpty { // Eğer ürünler daha önce yüklenmemişse
                                viewModel.fetchProducts()
                            }
        }
    }
}

struct ProductCell: View {
    var product: Product
    
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
            .padding(.leading, 10) // Resim için sol boşluk ekleyelim
            
            Text(product.title)
                .font(.system(size: 14))
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)
                .frame(width: 150, alignment: .leading)
                .padding(.leading, 10) // Başlık için sol boşluk ekleyelim
                .padding(.bottom, 8)
            
            Text("\(product.price, specifier: "%.2f")$")
                .font(.subheadline)
                .foregroundColor(Color("DarkBlue"))
                .frame(width: 150, alignment: .leading)
                .padding(.leading, 10) // Fiyat için sol boşluk ekleyelim
        }
        .padding(10)
        .frame(width: 180, height: 300)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 5)
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(HomeViewViewModel()) // Eğer environmentObject kullanıyorsanız burayı güncelleyin
    }
}
