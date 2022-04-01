//
//  HomeScreenRouter.swift
//  CleanArchitectureWithMVVM
//
//  Created by Muhammad Abubakar on 23/03/2022.
//

import Foundation

//MARK: - HomeScreenRouter Protocol
protocol HomeScreenRouterProtocol {
    var viewController: HomeViewController? { get }
    func navigateToDetailController(withRocket rocket: Rockets)
}

class HomeScreenRouter {
    
    //MARK: - Properties
    weak var viewController: HomeViewController?    
}

//MARK: - HomeScreenRouter Implementation
extension HomeScreenRouter: HomeScreenRouterProtocol {
    func navigateToDetailController(withRocket rocket: Rockets) {
        if let viewController = viewController {
            let controller = DetailViewController(rocket: rocket)
            viewController.navigationController?.pushViewController(controller, animated: true)
        }
    }
}
