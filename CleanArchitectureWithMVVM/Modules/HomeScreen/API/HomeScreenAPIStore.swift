//
//  HomeScreenService.swift
//  CleanArchitectureWithMVVM
//
//  Created by Muhammad Abubakar on 26/03/2022.
//

import Foundation

class HomeScreenAPIStore {
    
    let networkClient : NetworkClientProtocol
    
    init(networkClient: NetworkClientProtocol = NetworkClient.sharedInstance) {
        self.networkClient = networkClient
    }
    
}
extension HomeScreenAPIStore: HomeScreenProtocol  {
    
    func fetchAllRockets(completion: @escaping ([Rockets]?, Error?) -> ()) {
        guard let url = SpaceXEndpoints.getAllRockects.url() else {
            completion(nil, NetworkError.invalidURL)
            return
        }
        networkClient.sendRequestViaURL(url: url) { data, response, error in
            if let data = data {
                let decodedResponse = JSONCodable.decode(jsonData: data, usingModel: [Rockets].self)
                switch decodedResponse {
                    case .success(let responseString):
                        completion(responseString, nil)
                    case .failure:
                        completion(nil, NetworkError.jsonDecodingError)
                }
            }
            if let error = error {
                completion(nil, NetworkError.thrownError(error.localizedDescription))
            }
        }
    }
    func getUpComingLaunches(completion: @escaping ([Launch]?, Error?) -> ()) {
        guard let url = SpaceXEndpoints.getUpcomingLaunches.url() else {
            completion(nil, NetworkError.invalidURL)
            return
        }
        networkClient.sendRequestViaURL(url: url) { data, response, error in
            if let data = data {
                let decodedResponse = JSONCodable.decode(jsonData: data, usingModel: [Launch].self)
                switch decodedResponse {
                    case .success(let responseString):
                        completion(responseString, nil)
                    case .failure:
                        completion(nil, NetworkError.jsonDecodingError)
                }
            }
            if let error = error {
                completion(nil, NetworkError.thrownError(error.localizedDescription))
            }
        }
    }
}
