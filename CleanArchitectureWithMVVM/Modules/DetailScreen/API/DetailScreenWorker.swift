//
//  DetailScreenWorker.swift
//  CleanArchitectureWithMVVM
//
//  Created by Muhammad Abubakar on 29/03/2022.
//

import Foundation

class DetailScreenWorker {
    
    //MARK: - Properties
    let store: HomeScreenProtocol
    
    //MARK: - Initializers
    init(store: HomeScreenProtocol = HomeScreenAPIStore()) {
        self.store = store
    }
}

//MARK: - Functions
extension DetailScreenWorker {
    func getUpcomingLaunches(completion: @escaping DetailScreenViewModelHandler) {
        store.getUpComingLaunches { launch, error in
            if let launch = launch {
                completion(.UpcomingLaunches(launch))
            } else if let error = error {
                completion(.Failure(error.localizedDescription))
            }
        }
    }
}
