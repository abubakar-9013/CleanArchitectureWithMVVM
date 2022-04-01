//
//  Mass.swift
//  CleanArchitectureWithMVVM
//
//  Created by Muhammad Abubakar on 26/03/2022.

import Foundation

struct Mass : Codable {
    
    let kg : Int?
    let lb : Int?
    
    enum CodingKeys: String, CodingKey {
        case kg = "kg"
        case lb = "lb"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        kg = try values.decodeIfPresent(Int.self, forKey: .kg)
        lb = try values.decodeIfPresent(Int.self, forKey: .lb)
    }
    
}
