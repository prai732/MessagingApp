//
//  HomeCoordinator.swift
//  MessagingApp
//
//  Created by fordlabs on 14/08/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import Foundation
import UIKit
class HomeCoordinator: Coordinator{
    var navigationController: UINavigationController
    var childCoordinator: [Coordinator] = []
    var data: [MessagingAppDataModel]
    
    init(navigationController:UINavigationController,data:[MessagingAppDataModel]){
        self.navigationController = navigationController
        self.data = data
    }
    
    func start() {
        let landingScreenViewController = LandingScreenViewController(data: data)
        landingScreenViewController.delegate = self
        navigationController.pushViewController(landingScreenViewController, animated: true)
    }
    
}

extension HomeCoordinator: LandingScreenViewControllerDelegate{
    func loadData(name: [MessagingAppDataModel], indexPath: IndexPath) {
        let detailMessageCoordinator = DetailMessageCoordinator(data: name, indexPath: indexPath, navigationController: navigationController)
        startChildCoordinator(coordinator: detailMessageCoordinator)
    }

    
    func startChildCoordinator(coordinator: Coordinator){
        childCoordinator.removeAll()
        childCoordinator.append(coordinator)
        coordinator.start()
    }
    
}
