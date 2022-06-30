//
//  WebServiceHandler.swift
//  VirtusaApp
//
//  Created by VenkataRao on 21/06/22.
//


import Foundation

class WebServiceHandler {
    
    static let sharedInstance = WebServiceHandler()
    private init() {}
    
    var isLoading = false
    
    func signup() {
        isLoading = true
    }
}
