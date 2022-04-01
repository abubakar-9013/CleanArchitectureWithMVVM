//
//  HomeScreenWorker.swift
//  CleanArchitectureWithMVVM
//
//  Created by Muhammad Abubakar on 26/03/2022.
//

import Foundation

class HomeScreenWorker {
    
    //MARK: - Properties
    let store: HomeScreenProtocol
    
    //MARK: - Initializers
    init(store: HomeScreenProtocol = HomeScreenAPIStore()) {
        self.store = store
    }
}

//MARK: - Functions
extension HomeScreenWorker {
    func fetchAllRockets(completion: @escaping HomeScreenViewModelHandler) {
        
        store.fetchAllRockets { rockets, error in
            if let rockets = rockets {
                completion(.ListOfRockets(rockets))
            } else if let error = error {
                completion(.Failure(error.localizedDescription))
            }
        }
    }
}
