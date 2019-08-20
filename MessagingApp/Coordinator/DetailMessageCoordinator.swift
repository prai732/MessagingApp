//
//  DetailMessageCoordinator.swift
//  MessagingApp
//
//  Created by fordlabs on 20/08/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import Foundation
import UIKit

class DetailMessageCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinator: [Coordinator] = []
    var data: [MessagingAppDataModel]
    var indexPath: IndexPath
    
    init(data: [MessagingAppDataModel], indexPath: IndexPath, navigationController: UINavigationController){
        self.navigationController = navigationController
        self.data = data
        self.indexPath  = indexPath
    }
    
    func start() {
        let detailMessageViewController = DetailMessageViewController(data: data, indexPath: indexPath)
        navigationController.pushViewController(detailMessageViewController, animated: true)
    }
}
