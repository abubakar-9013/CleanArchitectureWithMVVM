//
//  FirstStage.swift
//  CleanArchitectureWithMVVM
//
//  Created by Muhammad Abubakar on 26/03/2022.

import Foundation

struct LaunchFirstStage : Codable {
    
    let cores : [Core]?
    
    enum CodingKeys: String, CodingKey {
        case cores = "cores"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        cores = try values.decodeIfPresent([Core].self, forKey: .cores)
    }
}
