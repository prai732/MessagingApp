//
//  DetailMessageCoordinatorTest.swift
//  MessagingAppTests
//
//  Created by fordlabs on 20/08/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import XCTest
@testable import MessagingApp

class DetailMessageCoordinatorTest: XCTestCase {
    var subject: DetailMessageCoordinator!
    var navigationController: UINavigationController!
    var fakeData: [MessagingAppDataModel]!
    
    override func setUp() {
        fakeData = [MessagingAppDataModel(name: "Pawan", textMessage: [ TextMessage(text: "You are awesome!", receivedMessage: true), TextMessage(text: "Thankyou!", receivedMessage: false)])]
        navigationController = UINavigationController()
        navigationController.pushViewController(LandingScreenViewController(data: fakeData), animated: true)
        subject = DetailMessageCoordinator(data: fakeData, indexPath: IndexPath(row: 0, section: 0), navigationController: navigationController)
    }
    
    func testWhenStartFunctionIsCalledThenLandingViewControllerShouldLoaded(){
        subject.start()
        navigationController.topViewController?.isKind(of: DetailMessageViewController.self)
    }
}
