//
//  FormTests.swift
//  iOS Example
//
//  Created by Aaron McTavish on 14/01/2016.
//  Copyright © 2016 ustwo. All rights reserved.
//

import XCTest

class FormTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNameTextField_NoAllowedViolations() {
        let app = XCUIApplication()
        let expectedResult = "Foo"
        
        let nameTextfieldTextField = app.textFields[FormAccessibility.Identifiers.NameTextField]
        nameTextfieldTextField.tap()
        nameTextfieldTextField.typeText(expectedResult + "12 ?")
        
        let actualResult = nameTextfieldTextField.value as? String
        
        XCTAssertEqual(actualResult, expectedResult, "The text field should have text \(expectedResult) but received \(actualResult).")
    }
    
}
