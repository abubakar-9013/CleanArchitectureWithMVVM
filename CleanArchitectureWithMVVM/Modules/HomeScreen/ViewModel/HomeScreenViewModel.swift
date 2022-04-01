//
//  HomeScreenViewModel.swift
//  CleanArchitectureWithMVVM
//
//  Created by Muhammad Abubakar on 23/03/2022.
//

import Foundation

//MARK: - ViewModel States
enum HomeScreenViewModelStates {
    case ListOfRockets([Rockets])
    case Failure(String)
}
typealias HomeScreenViewModelHandler = (HomeScreenViewModelStates) -> Void

class HomeScreenViewModel {
    
    //MARK: - Properties
    let worker: HomeScreenWorker
    
    //MARK: - Init
    init(worker: HomeScreenWorker = HomeScreenWorker()) {
        self.worker = worker
    }
}

//MARK: - Functions
extension HomeScreenViewModel {
    func fetchAllRockets(completion:@escaping HomeScreenViewModelHandler) {
        worker.fetchAllRockets { result in
            completion(result)
        }
    }
}
