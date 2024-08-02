//
//  File.swift
//  AbonsShoppy_e-commerce_ios_App
//
//  Created by Ezgi Karahan on 24.07.2024.
//

import Foundation

//ENDPOINT
enum Endpoint {
    case users
    case user(id: Int)
    case usersWithLimit(limit: Int)
    case usersSorted(sort: String)
    case carts
    case cart(id: Int)
    case cartsWithLimit(limit: Int)
    case cartsSorted(sort: String)
    case cartsInDateRange(startDate: String, endDate: String)
    case cartsByUser(userId: Int)
    case products
    case product(id: Int)
    case productsWithLimit(limit: Int)
    case productsSorted(sort: String)
    case categories
    case productsInCategory(category: String)
    
    var url: String {
            switch self {
            case .users:
                return "users"
            case .user(let id):
                return "users/\(id)"
            case .usersWithLimit(let limit):
                return "users?limit=\(limit)"
            case .usersSorted(let sort):
                return "users?sort=\(sort)"
            case .carts:
                return "carts"
            case .cart(let id):
                return "carts/\(id)"
            case .cartsWithLimit(let limit):
                return "carts?limit=\(limit)"
            case .cartsSorted(let sort):
                return "carts?sort=\(sort)"
            case .cartsInDateRange(let startDate, let endDate):
                return "carts?startdate=\(startDate)&enddate=\(endDate)"
            case .cartsByUser(let userId):
                return "carts/user/\(userId)"
            case .products:
                return "products"
            case .product(let id):
                return "products/\(id)"
            case .productsWithLimit(let limit):
                return "products?limit=\(limit)"
            case .productsSorted(let sort):
                return "products?sort=\(sort)"
            case .categories:
                return "products/categories"
            case .productsInCategory(let category):
                return "products/category/\(category)"
            }
        }
}

//PRODUCT MODEL
struct Product: Codable {
    let id: Int
    let title : String
    let price: Double
    let category: String
}

//CART MODEL2
struct Cart: Codable {
    let id: Int
    let userId: Int
    let date: String
    let products: [CartItem]
    
    struct CartItem: Codable{
        let productId : Int
        let quantity: Int
    }
}

//USER MODEL
struct User: Codable {
    let id: Int
    let email: String
    let username: String
    let password: String
    let name: Name
    let address: Address
    let phone: String
    
    struct Name: Codable {
        let firstname: String
        let lastname: String
    }
    
    struct Address: Codable {
        let city: String
        let street: String
        let number: Int
        let zipcode: String
        let geolocation: Geolocation
        
        struct Geolocation: Codable {
            let lat: String
            let long: String
        }
    }
}
