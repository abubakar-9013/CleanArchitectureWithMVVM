//
//  HomeScreenProtocol.swift
//  CleanArchitectureWithMVVM
//
//  Created by Muhammad Abubakar on 26/03/2022.
//

import Foundation

protocol HomeScreenProtocol {
    func fetchAllRockets(completion: @escaping(_ list: [Rockets]?, _ error: Error?) -> ())
    func getUpComingLaunches(completion:@escaping (_ launch: [Launch]?, _ error: Error?) -> ())
}
