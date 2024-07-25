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
                            ProductCellView(product: product)
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            
    }
}
