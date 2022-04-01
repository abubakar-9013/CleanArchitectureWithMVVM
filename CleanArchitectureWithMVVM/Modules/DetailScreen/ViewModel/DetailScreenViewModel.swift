//
//  DetailScreenViewModel.swift
//  CleanArchitectureWithMVVM
//
//  Created by Muhammad Abubakar on 23/03/2022.
//

import Foundation

//MARK: - ViewModel States
enum DetailScreenViewModelStates {
    case UpcomingLaunches([Launch])
    case Failure(String)
}
typealias DetailScreenViewModelHandler = (DetailScreenViewModelStates) -> Void

class DetailScreenViewModel {
    
    //MARK: - Properties
    let worker: DetailScreenWorker
    
    //MARK: - Init
    init(worker: DetailScreenWorker = DetailScreenWorker()) {
        self.worker = worker
    }
}

//MARK: - Functions
extension DetailScreenViewModel {
    func getUpcomingLaunches(completion:@escaping DetailScreenViewModelHandler) {
        worker.getUpcomingLaunches { result in
            completion(result)
        }
    }
}
