//
//  HomeViewViewModel.swift
//  AbonsShoppy_e-commerce_ios_App
//
//  Created by Ezgi Karahan on 24.07.2024.
//

import Foundation

class HomeViewViewModel: ObservableObject {
    
    @Published var products: [Product] = []
    
    init() {
        fetchProducts()
    }
    
    func fetchProducts() {
        NetworkManager.shared.fetchData(from: .products, expecting: [Product].self) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let products):
                    self.products = products
                    print("fetched products")
                case .failure(let error):
                    print("failed to fetch products")
                }
            }
        }
    }
}

