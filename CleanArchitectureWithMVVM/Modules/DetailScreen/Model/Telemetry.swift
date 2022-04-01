//
//  Telemetry.swift
//  CleanArchitectureWithMVVM
//
//  Created by Muhammad Abubakar on 26/03/2022.

import Foundation

struct Telemetry : Codable {
    
    let flightClub : String?
    
    enum CodingKeys: String, CodingKey {
        case flightClub = "flight_club"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        flightClub = try values.decodeIfPresent(String.self, forKey: .flightClub)
    }
}
