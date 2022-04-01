//
//  API.swift
//  CleanArchitectureWithMVVM
//
//  Created by Muhammad Abubakar on 28/03/2022.
//

import Foundation


//MARK: - FusionInspect Base URL
struct SpaceXAPI {
    static let baseURL = "https://api.spacexdata.com/v3"
}

//MARK: - URLConvertible
protocol URLConvertible {
    func url() -> URL?
}

//MARK: - FusionInspect Endpoints
enum SpaceXEndpoints {
    case getAllRockects
    case getRocketDetail(rocketId:String)
    case getUpcomingLaunches
    case getLaunchDetail(launchId:String)
}

//MARK: - FusionInspect Endpoint Extension
extension SpaceXEndpoints: URLConvertible {
    
    func url() -> URL? {
        switch self {
            case .getAllRockects:
                let endPoint = "/rockets"
                return URL(string: "\(SpaceXAPI.baseURL)\(endPoint)")
            case .getRocketDetail(let rocketId):
                let endPoint = "/rockets/\(rocketId)"
                return URL(string: "\(SpaceXAPI.baseURL)\(endPoint)")
            case .getUpcomingLaunches:
                let endPoint = "/launches/upcoming"
                return URL(string: "\(SpaceXAPI.baseURL)\(endPoint)")
            case .getLaunchDetail(let launchId):
                let endPoint = "/launches/\(launchId)"
                return URL(string: "\(SpaceXAPI.baseURL)\(endPoint)")
        }
    }
}

//MARK: - HTTPMethods
enum HTTPMethod: String {
    case Get = "GET"
    case Post = "POST"
}

//MARK: - HTTPHeaderFields
enum HTTPHeaderField: String {
    case Authorization = "Authorization"
    case ContentType   = "Content-Type"
    case Accept        = "Accept"
}

