//
//  File.swift
//  AbonsShoppy_e-commerce_ios_App
//
//  Created by Ezgi Karahan on 24.07.2024.
//

import Foundation

//Rating struct
struct Rating: Codable, Identifiable{
    
    var id: UUID = UUID()
    let rate: Double
    let count: Int
    
    enum CodingKeys: String, CodingKey {
        case rate
        case count
    }
}

//product struct

struct Product: Codable, Identifiable{
   
    var id: Int
    var title: String
    var price: Double
    var description: String
    var category: String
    var image: String
    var rating: Rating
        
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case price
        case description
        case category
        case image
        case rating
    }
}
