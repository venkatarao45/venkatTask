//
//  Test_SignupViewController.swift
//  VirtusaApp
//  Created by VenkataRao on 21/06/22.
//

import XCTest
@testable import VirtusaApp

class Test_SignupViewController: XCTestCase {
    var storyboard: UIStoryboard!
    var signupVC: SignupViewController!

    override func setUpWithError() throws {
        let model = SignupModel(firstName: "venkat", lastName: "K J", email: "venkat@gmail.com",
                                password: "@venkat1245", repeatedPassword: "@venkat1245")
        signupVC = SignupViewController.getVC(with: SignupVM(model: model))
        signupVC.loadViewIfNeeded()
    }
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        storyboard = nil
        signupVC = nil
    }
    
    func testSignupViewController_Check_IBOulets() throws {
        
        //Checks for IBoutlets
        XCTAssertNotNil(signupVC.firstName,  "Failed - The firstName TextField is not connected to an IBOutlet")
        XCTAssertNotNil(signupVC.lastName,  "Failed - The lastName TextField is not connected to an IBOutlet")
        XCTAssertNotNil(signupVC.email,     "Failed - The email TextField is not connected to an IBOutlet")
        XCTAssertNotNil(signupVC.password,  "Failed - The password TextField is not connected to an IBOutlet")
        XCTAssertNotNil(signupVC.repeatedPassword,  "Failed - The repeatedPassword TextField is not connected to an IBOutlet")
        XCTAssertNotNil(signupVC.signupButton,      "Failed - The signup Button is not connected to an IBOutlet")
    }
    
    func testSignupViewController_Check_TextFields_EmptyInitialValues() throws {
        
        //Check for Initial Empty Value
        XCTAssertEqual(signupVC.firstName.text, "", "Failed - First name text field was not empty when the view controller initially loaded")
        XCTAssertEqual(signupVC.lastName.text, "", "Failed - Last name text field was not empty when the view controller initially loaded")
        XCTAssertEqual(signupVC.email.text, "", "Failed - Email text field was not empty when the view controller initially loaded")
        XCTAssertEqual(signupVC.password.text, "","Failed - Password text field was not empty when the view controller initially loaded")
        XCTAssertEqual(signupVC.repeatedPassword.text, "","Failed - Repeat Password text field was not empty when the view controller initially loaded")
    }
    func testSignupViewController_Check_TextFields_Placeholder() throws {
        
        //Check for Placeholder
        XCTAssertEqual(signupVC.firstName.placeholder, Placeholder.firstName, "Failed - First name text field was not empty when the view controller initially loaded")
        XCTAssertEqual(signupVC.lastName.placeholder, Placeholder.lastName, "Failed - Last name text field was not empty when the view controller initially loaded")
        XCTAssertEqual(signupVC.email.placeholder, Placeholder.email, "Failed - Email text field was not empty when the view controller initially loaded")
        XCTAssertEqual(signupVC.password.placeholder, Placeholder.password,"Failed - Password text field was not empty when the view controller initially loaded")
        XCTAssertEqual(signupVC.repeatedPassword.placeholder, Placeholder.repeatedPassword,"Failed - Repeat Password text field was not empty when the view controller initially loaded")
    }
    func testSignupViewController_Check_TextFields_ContentTypes() throws {
        XCTAssertEqual(signupVC.firstName.textContentType, .namePrefix, "FirstName ContentType is not matching")
        XCTAssertEqual(signupVC.lastName.textContentType, .nameSuffix, "LastName ContentType is not matching")
        XCTAssertEqual(signupVC.email.textContentType, .emailAddress, "Email ContentType is not matching")
        XCTAssertEqual(signupVC.password.textContentType, .password, "Password ContentType is not matching")
        XCTAssertEqual(signupVC.repeatedPassword.textContentType, .password, "Repeated Password ContentType is not matching")
    }
    func testSignupViewController_Check_TextFields_KeyboardType() throws {
        XCTAssertEqual(signupVC.firstName.keyboardType, .asciiCapable, "FirstName keyboardType is not matching")
        XCTAssertEqual(signupVC.lastName.keyboardType, .asciiCapable, "LastName keyboardTypekeyboardType is not matching")
        XCTAssertEqual(signupVC.email.keyboardType, .emailAddress, "Email keyboardType is not matching")
        XCTAssertEqual(signupVC.password.keyboardType, .asciiCapable, "Password keyboardType is not matching")
        XCTAssertEqual(signupVC.repeatedPassword.keyboardType, .asciiCapable, "Repeated Password keyboardType is not matching")
    }
    func testSignupViewController_Check_TextFields_SecureTextKey() throws {
        XCTAssertTrue(signupVC.password.isSecureTextEntry, "Password doesnt have SecureTextKey")
        XCTAssertTrue(signupVC.repeatedPassword.isSecureTextEntry, "Repeated Password doesnt have SecureTextKey")
    }
    func testSignupViewController_Check_SignUpButton() throws {
        // Arrange - Checks for IBOutlet
        let signupButton: UIButton = try XCTUnwrap(signupVC.signupButton, "Signup button does not have a referencing outlet")
        
        // Act - Get the ActionName and TitleLabelText
        let signupButtonActions = try XCTUnwrap(signupButton.actions(forTarget: signupVC, forControlEvent: .touchUpInside), "Signup button does not have any actions assigned to it")
        let signupButtonTitle = signupButton.titleLabel?.text

        // Assert - Check for IBAction
        XCTAssertEqual(signupButtonActions.count, 1)
        XCTAssertEqual(signupButtonActions.first, "signupAction:", "There is no action with a name signupButtonTapped assigned to signup button")
        XCTAssertEqual(signupButtonTitle, "Sign up","signup Button TitleLabel text is a \"Sign up\"")
    }
    func testViewController_WhenSignupButtonTapped_InvokesSignupWebService() {
        // Arrange
        let handler = WebServiceHandler.sharedInstance
        
        // Act
        signupVC.signupButton.sendActions(for: .touchUpInside)
        
        // Assert
        XCTAssertTrue(handler.isLoading, "Signup Action doesn't invokes the WebService")
    }
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
