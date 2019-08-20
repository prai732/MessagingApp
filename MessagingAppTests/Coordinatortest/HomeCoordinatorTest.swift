//
//  HomeCoordinatorTest.swift
//  MessagingAppTests
//
//  Created by fordlabs on 14/08/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import XCTest
@testable import MessagingApp

class HomeCoordinatorTest: XCTestCase {
    
    var subject: HomeCoordinator!
    var navigationController: UINavigationController!
    var fakeData: [MessagingAppDataModel]!

    override func setUp() {
        fakeData = [MessagingAppDataModel(name: "Pawan", textMessage: [TextMessage(text: "Hey Pawan", receivedMessage: true)]), MessagingAppDataModel(name: "Rai", textMessage: [TextMessage(text: "Hey Rai", receivedMessage: false)])]
        navigationController = UINavigationController()
        subject = HomeCoordinator(navigationController: navigationController, data: fakeData)
    }
    
    func testWhenStartFunctionIsCalledThenLandingViewControllerShouldLoaded(){
        subject.start()
        navigationController.topViewController?.isKind(of: LandingScreenViewController.self)
    }
    
    func testWhenLoadDataMethodOfHomeCoordinatorIsCalledThenItShouldNavigateDetailMVC(){
        subject.loadData(name: fakeData, indexPath: IndexPath(row: 0, section: 0))
        XCTAssert(navigationController.topViewController?.isKind(of: DetailMessageViewController.self) ?? false)
    }

}
