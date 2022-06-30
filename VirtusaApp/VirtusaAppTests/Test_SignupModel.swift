//
//  Test_SignupModel.swift
//  VirtusaAppTests
//
//
//  Created by VenkataRao on 21/06/22.
//

import XCTest
@testable import VirtusaApp

class Test_SignupModel: XCTestCase {
    var model: SignupModel!
    
    override func setUpWithError() throws {
        print("setUpWithError")
        model = SignupModel(firstName: "venkat", lastName: "T", email: "venkat@gmail.com",
                            password: "@venkat1245", repeatedPassword: "@venkat1245")
    }
    override func tearDownWithError() throws {
        model = nil
        print("tearDownWithError")
    }
    
    func test_ValidateUserName() {
        // Arrange - data should be provided to the test
        model.firstName = "venkat"
        model.lastName = "N C"
        
        // Act - Invoke the actual method under test
        let isValidFirstName = model.isValidFirstName
        let isValidLastName = model.isValidLastName
        
        // Assert
        XCTAssertTrue(isValidFirstName, "First name is not a valid one")
        XCTAssertTrue(isValidLastName, "Last name is not a valid one")
    }
    
    func test_EmailValidation() {
        // Arrange
        model.email = "Venkat@google.com"
        
        // Act
        let isValidEmail = model.isValidEmail
        
        // Assert
        XCTAssertTrue(isValidEmail, "Email is not valid")
        XCTAssertFalse(isValidEmail, "Email is valid")
        XCTAssert(isValidEmail, "Email is not valid")
    }
    
    func test_PasswordValidation() throws {
        // Arrange
        model.password = "Mobility@123"
        model.repeatedPassword = "Mobility@123"
        
        // Act
        let isValidPassword = model.isValidPassword
        
        // Assert
        XCTAssertTrue(isValidPassword, "Password is not a valid one")
    }
    
    func test_PasswordIdenticalCheck() {
        // Arrange
        model.password = "Mobility@123"
        model.repeatedPassword = "Mobility@123"
        
        // Assert
        XCTAssertEqual(model.password, model.repeatedPassword, "Password and RepearedPassword is not identical")
        XCTAssertNotEqual(model.password, model.repeatedPassword, "Password and RepearedPassword is identical")
    }
    
    func test_SignupModel_Nil() throws {
        XCTAssertNil(model,  "SignupModel is Not Nil")
        XCTAssertNotNil(model,  "SignupModel is Nil")
        
        
        if let theSignupModel = model {
            XCTAssertEqual(theSignupModel.firstName.count, 0, "Uer's FirstName is non Empty")
        } else {
            XCTFail("Failed to SignupModel")
        }
    }
    
    func test_SignupModel_ValidateFirstNameCharacterLimit() {
        // model = SignupModel(firstName: "Akilan", lastName: "T", email: "akilan@gmail.com", password: "@kiLan0609", repeatedPassword: "@kiLan0609")
        XCTAssertGreaterThan(characterRange.firstNameMaxLength, model.firstName.count, "FirstName is GreaterThan \(characterRange.firstNameMaxLength)")
        XCTAssertGreaterThanOrEqual(characterRange.firstNameMaxLength, model.firstName.count, "FirstName is GreaterThanOrEqual to \(characterRange.firstNameMaxLength)")
        
        XCTAssertLessThan(characterRange.firstNameMinLength, model.firstName.count, "FirstName is LessThan \(characterRange.firstNameMinLength)")
        XCTAssertLessThanOrEqual(characterRange.firstNameMinLength, model.firstName.count, "FirstName is LessThanOrEqual to \(characterRange.firstNameMinLength)")
    }
}



