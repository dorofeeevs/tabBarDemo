//
//  ProductPresenter.swift
//  tabBar
//
//  Created by Aleksandr Dorofeev on 04.06.2021.
//

import Foundation

protocol ProductViewProtocol: class {
    func success()
    func failure(error: Error)
}

protocol ProductViewControllerPresenterProtocol: class {
    init(view: ProductViewProtocol, networkSevice: NetworkServiceProtocol)
    func getProducts()
    var products: [Product]? {get set}
}

class ProductPresenter: ProductViewControllerPresenterProtocol {
    weak var view: ProductViewProtocol?
    let networkService: NetworkServiceProtocol!
    var products: [Product]?
    
    required init(view: ProductViewProtocol, networkSevice: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkSevice
        getProducts()
    }
    
    func getProducts() {
        networkService.getProducts { [weak self] result in
            guard let self = self else {return}
            DispatchQueue.main.async {
                switch result {
                case .success(let products):
                    self.products = products
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
}
