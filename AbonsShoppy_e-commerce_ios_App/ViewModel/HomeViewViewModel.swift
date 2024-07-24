//
//  HomeViewViewModel.swift
//  AbonsShoppy_e-commerce_ios_App
//
//  Created by Ezgi Karahan on 24.07.2024.
//

import Foundation

class HomeViewViewModel: ObservableObject {
    
    @Published var products: [Product] = []
    private var networkManager = NetworkManager()
    
    init() {
        fetchProducts()
    }
    
    func fetchProducts() {
        networkManager.fetchProducts()
        self.products = networkManager.products
    }
}

