//
//  Isp.swift
//  CleanArchitectureWithMVVM
//
//  Created by Muhammad Abubakar on 26/03/2022.

import Foundation

struct Isp : Codable {
    
    let seaLevel : Double?
    let vacuum : Double?
    
    enum CodingKeys: String, CodingKey {
        case seaLevel = "sea_level"
        case vacuum = "vacuum"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        seaLevel = try values.decodeIfPresent(Double.self, forKey: .seaLevel)
        vacuum = try values.decodeIfPresent(Double.self, forKey: .vacuum)
    }
    
}
