//
//  LoginViewController.swift
//  N&T
//
//  Created by 강소원 on 10/24/24.
//

import UIKit

class LoginViewController: UIViewController {

    // 로그인 버튼
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .blue
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
    }
    
    // UI설정하는 코드, 버튼의 오토레이아웃
    func makeUI() {
        view.backgroundColor = #colorLiteral(red: 0.8321695924, green: 0.985483706, blue: 0.4733308554, alpha: 1)
        view.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            loginButton.widthAnchor.constraint(equalToConstant: 120),
            loginButton.heightAnchor.constraint(equalToConstant: 45),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
    
    // 버튼 누르면 동작하는 코드 ===> 로그인하면, 디스미스 (탭바가 더 아래에 깔려있음)
    @objc func loginButtonTapped() {
        // 로그인 성공 시
        LoginManager.shared.login()
        dismiss(animated: true, completion: nil)
    }

}
