//
//  FormTests.swift
//  macOS Example
//
//  Created by Aaron McTavish on 09/01/2017.
//  Copyright © 2017 Ustwo Fampany Ltd. All rights reserved.
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
    
    func testTextField_NoAllowedViolations() {
        let app = XCUIApplication()
        let expectedResult = "Foo"
        
        let nameTextField = app.textFields[FormAccessibility.Identifiers.NameTextField]
        nameTextField.click()
        nameTextField.typeText(expectedResult + "12 ?")
        
        let actualResult = nameTextField.value as? String
        
        XCTAssertEqual(actualResult, expectedResult, "The text field should have text \(expectedResult.debugDescription) but received \(actualResult.debugDescription).")
    }
    
    func testTextField_AllowedViolations() {
        let app = XCUIApplication()
        let expectedResult = "Foo12"
        
        let titleTextField = app.textFields[FormAccessibility.Identifiers.TitleTextField]
        titleTextField.click()
        titleTextField.typeText(expectedResult)
        
        let actualResult = titleTextField.value as? String
        
        XCTAssertEqual(actualResult, expectedResult, "The text field should have text \(expectedResult.debugDescription) but received \(actualResult.debugDescription).")
    }
    
    func testTextField_AllowedViolations_and_validateOnFocusLossOnly() {
        let app = XCUIApplication()
        let expectedResult = "Foo12 ?"
        
        let emailTextField = app.textFields[FormAccessibility.Identifiers.EmailTextField]
        emailTextField.click()
        emailTextField.typeText(expectedResult)
        
        let actualResult = emailTextField.value as? String
        
        XCTAssertEqual(actualResult, expectedResult, "The text field should have text \(expectedResult.debugDescription) but received \(actualResult.debugDescription).")
    }
    
    func testForm_Valid() {
        let app = XCUIApplication()
        
        let title = "Developer"
        let name = "Foo"
        let email = "Bar@Baz.com"
        
        let titleTextField = app.textFields[FormAccessibility.Identifiers.TitleTextField]
        let nameTextField = app.textFields[FormAccessibility.Identifiers.NameTextField]
        let emailTextField = app.textFields[FormAccessibility.Identifiers.EmailTextField]
        let submitButton = app.buttons[FormAccessibility.Identifiers.SubmitButton]
        
        titleTextField.click()
        titleTextField.typeText(title)
        
        nameTextField.click()
        nameTextField.typeText(name)
        
        emailTextField.click()
        emailTextField.typeText(email)
        
        let successAlert = app.staticTexts[NSLocalizedString("Success: Your data has been submitted!", comment: "")]
        let exists = NSPredicate(format: "exists == true")
        expectation(for: exists, evaluatedWith: successAlert, handler: nil)
        
        submitButton.click()
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    func testForm_Invalid() {
        let app = XCUIApplication()
        
        let title = "Developer"
        let name = "Foo"
        let email = "Bar"
        
        let titleTextField = app.textFields[FormAccessibility.Identifiers.TitleTextField]
        let nameTextField = app.textFields[FormAccessibility.Identifiers.NameTextField]
        let emailTextField = app.textFields[FormAccessibility.Identifiers.EmailTextField]
        let submitButton = app.buttons[FormAccessibility.Identifiers.SubmitButton]
        
        titleTextField.click()
        titleTextField.typeText(title)
        
        nameTextField.click()
        nameTextField.typeText(name)
        
        emailTextField.click()
        emailTextField.typeText(email)
        
        let successAlert = app.staticTexts[NSLocalizedString("Error: Please correct your entries in the form.", comment: "")]
        let exists = NSPredicate(format: "exists == true")
        expectation(for: exists, evaluatedWith: successAlert, handler: nil)
        
        submitButton.click()
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
}
