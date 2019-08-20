//
//  LandingScreenViewControllerTest.swift
//  MessagingAppTests
//
//  Created by fordlabs on 14/08/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import XCTest
@testable import MessagingApp

class LandingScreenViewControllerTest: XCTestCase {
    var subject: LandingScreenViewController!
    var mockNavigationController: MockNavigationController!
    var mockCoordinator: MockCoordinator!
    var fakeData: [MessagingAppDataModel]!
    
    
    override func setUp() {
         fakeData = [MessagingAppDataModel(name: "Pawan", textMessage: [TextMessage(text: "Hey Pawan", receivedMessage: true)]), MessagingAppDataModel(name: "Rai", textMessage: [TextMessage(text: "Hey Rai", receivedMessage: false)])]
        subject = LandingScreenViewController(data: fakeData)
        mockNavigationController = MockNavigationController(rootViewController: subject)
        mockCoordinator = MockCoordinator()
        subject.delegate = mockCoordinator
        subject.view.setNeedsLayout()
        subject.view.layoutIfNeeded()
        
        _ = subject.view
    }
    
    func testWhenLandingScreenViewControllerIsLoadedThenOneLabelAndOneTableViewShouldPresent(){
        let labelField = findLabelsforViews(view: subject.view, labelText: "Messaging App")
        let tableView = findTableViewForViews(view: subject.view)
        XCTAssertNotNil(tableView)
        XCTAssertNotNil(labelField)
        
    }
    
    func testWhenLandingScreenViewControllerIsLoadedThenItShouldHaveTwoRows(){
        let tableView = findTableViewForViews(view: subject.view)
        XCTAssertEqual(tableView?.numberOfRows(inSection: 0),2)
    }
    
    func testWhenLandingScreenViewIsLoadedThenTableViewDataShouldBeEqualTodataPAssed(){
        let tableView = findTableViewForViews(view: subject.view)
        for row in 0...1{
        let indexPath = IndexPath(row: row, section: 0)
        let cell = tableView?.cellForRow(at: indexPath) as! TableViewCell
        XCTAssertEqual(cell.nameLabel.text, fakeData[row].name)
        XCTAssertEqual(cell.textMessage.text, fakeData[row].textMessage[0].text)
        }
    }
    
    func testWhenAnyRowOfTheTableViewIsTappedThenLoadDataMethodsShouldGetCalled(){
        let tableView = findTableViewForViews(view: subject.view)
        for row in 0...1{
            let indexPath = IndexPath(row: row, section: 0)
            let cell = tableView?.cellForRow(at: indexPath) as! TableViewCell


        }
    }
    
    
    func findLabelsforViews(view: UIView, labelText: String)->UILabel?{
        for subview in view.subviews {
            if let label = subview as? UILabel, label.text == labelText{
                return label
            }
        }
        return nil
    }
    
    func findTableViewForViews(view: UIView)->UITableView?{
        for subView in view.subviews {
            if let tableView = subView as? UITableView{
                return tableView
            }
        }
        return nil
        
    }
}

class MockNavigationController: UINavigationController{
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: false)
    }
}
    
class MockCoordinator: LandingScreenViewControllerDelegate{
    var loadData = false
    
    func loadData(name: [MessagingAppDataModel], indexPath: IndexPath) {
        loadData = true
    }
    
}
