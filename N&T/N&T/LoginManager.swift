//
//  LoginManager.swift
//  N&T
//
//  Created by 강소원 on 10/24/24.
//

import UIKit

class LoginManager {
    static let shared = LoginManager()
        
        var isLoggedIn: Bool {
            return UserDefaults.standard.bool(forKey: "isLoggedIn")
        }
        
        func login() {
            // 로그인 로직
            UserDefaults.standard.set(true, forKey: "isLoggedIn")
        }
        
        func logout() {
            // 로그아웃 로직
            UserDefaults.standard.set(false, forKey: "isLoggedIn")
        }
}
