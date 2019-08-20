//
//  DetailMessageViewControllerTest.swift
//  MessagingAppTests
//
//  Created by fordlabs on 14/08/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import XCTest
@testable import MessagingApp

class DetailMessageViewControllerTest: XCTestCase {
    
    var subject: DetailMessageViewController!
    var mockNavigationController: MockNavigationController!
    var fakeData: [MessagingAppDataModel]!

    override func setUp() {
         fakeData = [MessagingAppDataModel(name: "Pawan", textMessage: [ TextMessage(text: "You are awesome!", receivedMessage: true), TextMessage(text: "Thankyou!", receivedMessage: false)])]
        subject = DetailMessageViewController(data: fakeData, indexPath: IndexPath(row: 0, section: 0))
        mockNavigationController = MockNavigationController(rootViewController: subject)
        subject.view.setNeedsLayout()
        subject.view.layoutIfNeeded()
        
        _ = subject.view
        
    }
    
    func testWhenDetailMessageViewControllerIsLoadedThenOneLabelOneTableViewOneTextViewAndOneButtonShouldPresent(){
        let nameLabel = findLabelsforViews(view: subject.view, labelText: "Pawan")
        let tableView = findTableViewForViews(view: subject.view)
        let textView = findTextViewforViews(view: subject.view)
        let button = findButtonForViews(view: subject.view, text: "SEND")
        
        XCTAssertNotNil(nameLabel)
        XCTAssertNotNil(tableView)
        XCTAssertNotNil(textView)
        XCTAssertNotNil(button)
        
    }
    
    func testWhenDetailMessageViewControllerIsLoadedThenItShouldHaveOneRows(){
        let tableView = findTableViewForViews(view: subject.view)
        XCTAssertEqual(tableView?.numberOfRows(inSection: 0),2)
    }
    
    func testWhenDetailMessageViewControllerIsLoadedThenTableViewCellDataShouldBeEqualToDataPassedFromLandingScreenViewController(){
        let tableView = findTableViewForViews(view: subject.view)
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = tableView?.cellForRow(at: indexPath) as! DetailedTableViewCell
        XCTAssertEqual(cell.textMessage.text, fakeData[indexPath.row].textMessage[indexPath.row].text)
    }
    
    func findLabelsforViews(view: UIView, labelText: String)->UILabel?{
        for subview in view.subviews {
            if let label = subview as? UILabel, label.text == labelText{
                return label
            }
        }
        return nil
    }
    
    func findTextViewforViews(view: UIView)->UITextView?{
        for subview in view.subviews {
            if let textView = subview as? UITextView{
                return textView
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
    
    func findButtonForViews(view: UIView,text: String)->UIButton?{
        for subView in view.subviews {
            if let button = subView as? UIButton, button.titleLabel?.text == text{
                return button
            }
        }
        return nil
        
    }
}
