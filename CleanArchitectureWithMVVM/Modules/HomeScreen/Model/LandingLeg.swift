//
//  LandingLeg.swift
//  CleanArchitectureWithMVVM
//
//  Created by Muhammad Abubakar on 26/03/2022.

import Foundation

struct LandingLeg : Codable {
    
    let material : String?
    let number : Int?
    
    enum CodingKeys: String, CodingKey {
        case material = "material"
        case number = "number"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        material = try values.decodeIfPresent(String.self, forKey: .material)
        number = try values.decodeIfPresent(Int.self, forKey: .number)
    }
    
}
