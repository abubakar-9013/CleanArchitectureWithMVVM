//
//  PayloadWeight.swift
//  CleanArchitectureWithMVVM
//
//  Created by Muhammad Abubakar on 26/03/2022.

import Foundation

struct PayloadWeight : Codable {
    
    let id : String?
    let kg : Int?
    let lb : Int?
    let name : String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case kg = "kg"
        case lb = "lb"
        case name = "name"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        kg = try values.decodeIfPresent(Int.self, forKey: .kg)
        lb = try values.decodeIfPresent(Int.self, forKey: .lb)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }
    
}
