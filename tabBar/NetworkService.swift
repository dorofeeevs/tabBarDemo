//
//  NetworkService.swift
//  tabBar
//
//  Created by Aleksandr Dorofeev on 04.06.2021.
//

import Foundation

protocol NetworkServiceProtocol {
    func getProducts(complition: @escaping(Result<[Product]?, Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    func getProducts(complition: @escaping (Result<[Product]?, Error>) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/products"
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                complition(.failure(error))
                return
            }
            do {
                let obj = try JSONDecoder().decode([Product].self, from: data!)
                complition(.success(obj))
            } catch {
                complition(.failure(error))
            }
        }.resume()
         
    }
    
    
}
