//
//  NetworkManager.swift
//  AbonsShoppy_e-commerce_ios_App
//
//  Created by Ezgi Karahan on 24.07.2024.
//

//url session ve json decoder kullanıldı. urlSession ve jsonserialization da kullanılabilirdi.
import Foundation

class NetworkManager: ObservableObject {
    @Published var products: [Product] = []
    
    func fetchProducts() {
        guard let url = URL(string: "https://fakestoreapi.com/products") else {
            print("url hatası")
            return }
       
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode([Product].self, from: data)
                    DispatchQueue.main.async {
                        self.products = decodedData
                        
                    }
                } catch {
                    print("Error decoding data: \(error)")
                }
            }
        }.resume()
    }
}
