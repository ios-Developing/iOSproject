//
//  LoginViewModel.swift
//  Project1
//
//  Created by Dmitry on 27/2/24.
//

import UIKit

class LoginViewModel: ObservableObject {
    
    @Published var isLogin = false
    
    @Published var token = "" {
        didSet {
            isLogin = true
        }
    }
}
