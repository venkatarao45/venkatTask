//
//  SignupVM.swift
//  VirtusaApp
//
//  Created by VenkataRao on 21/06/22.
//


import Foundation

class SignupVM {
	
    var signupModel: SignupModel!
    
    init(model: SignupModel) {
        self.signupModel = model
    }
    
    var isValidEntries: Bool {
        guard let model = signupModel else { return false}
        return model.isValidFirstName && model.isValidLastName && model.isValidEmail && model.isValidPassword
    }
        
    deinit {
        print("$$ SignupVM - deinit")
    }
}
