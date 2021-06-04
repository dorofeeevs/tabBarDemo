//
//  Product.swift
//  tabBar
//
//  Created by Aleksandr Dorofeev on 03.06.2021.
//

import Foundation

struct Product: Decodable {
    let productTitle: String
    let productCost: String
    let productRaiting: String
    let productImageName: String
}
