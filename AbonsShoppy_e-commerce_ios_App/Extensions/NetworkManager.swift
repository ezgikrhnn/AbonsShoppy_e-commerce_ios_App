//
//  NetworkManager.swift
//  AbonsShoppy_e-commerce_ios_App
//
//  Created by Ezgi Karahan on 24.07.2024.
//

//url session ve json decoder kullanıldı. urlSession ve jsonserialization da kullanılabilirdi.
import Foundation

class NetworkManager {
    
   static let shared = NetworkManager() //static yapmazsan çalışmaz
    private init() { }  //shared singletone'unu tanımladıgım için init lazım.

    //fetchData func:
    /**Bu fonksiyon verilen endpointten veri çekmek ve bu veriyi belirtilen türde çözümlemek için kullanılır.**/
    func fetchData<T: Codable>(from endpoint: Endpoint, expecting type: T.Type, completion: @escaping (Result<T, Error>)-> Void) {
         
        // 1- url al:
        let baseUrl = "https://fakestoreapi.com"
        guard let url = URL(string: "\(baseUrl)/\(endpoint.url)") else { print("geçersiz url")
            return }
        
        // 2- URLSession ile istek:
        let task = URLSession.shared.dataTask(with:url) { data, response, error in
             
            // 3 - urlsession içinde error kontrolü
            if let error = error {
                completion(.failure(error))
                return
            }
            
            // 4 - urlsession içi data kontrolu
            guard let data = data else {
                completion(.failure(NSError(domain: "No Data", code: 0,  userInfo: nil)))
                return
            }
            
            // 5 - veriyi jsondecoder ile al: do try catch
            do{
                let decodedData = try JSONDecoder().decode(type, from: data)
                completion(.success(decodedData))
            }catch{
                completion(.failure(error))
            }
        }
        task.resume()
        
    }
    
}
