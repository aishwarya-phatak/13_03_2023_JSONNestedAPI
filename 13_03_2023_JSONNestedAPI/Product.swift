//
//  Product.swift
//  13_03_2023_JSONNestedAPI
//
//  Created by Vishal Jagtap on 11/05/23.
//

import Foundation
struct Product : Decodable{
    var id : Int
    var title : String
    var price : Double
    var rate : Double
    var count : Int
    
    enum ProductKeys : CodingKey{
        case id
        case title
        case price
        case rating
    }
    
    enum RatingKeys : CodingKey{
        case rate
        case count
    }
    
    init(from decoder: Decoder) throws {
        let productsContainer = try! decoder.container(keyedBy: ProductKeys.self)
        id = try! productsContainer.decode(Int.self, forKey: ProductKeys.id)
        title = try! productsContainer.decode(String.self, forKey: ProductKeys.title)
        price = try! productsContainer.decode(Double.self, forKey: ProductKeys.price)
        
        let ratingContainer = try! productsContainer.nestedContainer(keyedBy: RatingKeys.self, forKey: ProductKeys.rating)
        rate = try! ratingContainer.decode(Double.self, forKey: RatingKeys.rate)
        count = try! ratingContainer.decode(Int.self, forKey: RatingKeys.count)
    }
}
