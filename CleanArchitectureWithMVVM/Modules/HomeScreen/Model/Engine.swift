//
//  Engine.swift
//  CleanArchitectureWithMVVM
//
//  Created by Muhammad Abubakar on 26/03/2022.

import Foundation

struct Engine : Codable {
    
    let engineLossMax : Int?
    let isp : Isp?
    let layout : String?
    let number : Int?
    let propellant1 : String?
    let propellant2 : String?
    let thrustSeaLevel : ThrustSeaLevel?
    let thrustToWeight : Double?
    let thrustVacuum : ThrustVacuum?
    let type : String?
    let version : String?
    
    enum CodingKeys: String, CodingKey {
        case engineLossMax = "engine_loss_max"
        case isp = "isp"
        case layout = "layout"
        case number = "number"
        case propellant1 = "propellant_1"
        case propellant2 = "propellant_2"
        case thrustSeaLevel = "thrust_sea_level"
        case thrustToWeight = "thrust_to_weight"
        case thrustVacuum = "thrust_vacuum"
        case type = "type"
        case version = "version"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        engineLossMax = try values.decodeIfPresent(Int.self, forKey: .engineLossMax)
        isp = try values.decodeIfPresent(Isp.self, forKey: .isp)
        layout = try values.decodeIfPresent(String.self, forKey: .layout)
        number = try values.decodeIfPresent(Int.self, forKey: .number)
        propellant1 = try values.decodeIfPresent(String.self, forKey: .propellant1)
        propellant2 = try values.decodeIfPresent(String.self, forKey: .propellant2)
        thrustSeaLevel = try values.decodeIfPresent(ThrustSeaLevel.self, forKey: .thrustSeaLevel)
        thrustToWeight = try values.decodeIfPresent(Double.self, forKey: .thrustToWeight)
        thrustVacuum = try values.decodeIfPresent(ThrustVacuum.self, forKey: .thrustVacuum)
        type = try values.decodeIfPresent(String.self, forKey: .type)
        version = try values.decodeIfPresent(String.self, forKey: .version)
    }
    
}
