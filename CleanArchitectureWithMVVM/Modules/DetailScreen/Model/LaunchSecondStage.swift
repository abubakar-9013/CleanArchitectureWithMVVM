//
//  SecondStage.swift
//  CleanArchitectureWithMVVM
//
//  Created by Muhammad Abubakar on 26/03/2022.

import Foundation

struct LaunchSecondStage : Codable {
    
    let block : Int?
    let payloads : [LaunchPayload]?
    
    enum CodingKeys: String, CodingKey {
        case block = "block"
        case payloads = "payloads"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        block = try values.decodeIfPresent(Int.self, forKey: .block)
        payloads = try values.decodeIfPresent([LaunchPayload].self, forKey: .payloads)
    }
}
