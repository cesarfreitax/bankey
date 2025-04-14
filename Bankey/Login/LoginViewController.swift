//
//  ViewController.swift
//  Bankey
//
//  Created by Bento, Cesar on 28/03/25.
//

import UIKit

protocol LoginViewControllerDelegate: AnyObject {
    func didLogin()
}

class LoginViewController: UIViewController {
    let loginView = LoginView()
    let signInButton = UIButton()
    let errorText = UILabel()
    
    weak var delegate: LoginViewControllerDelegate?
    
    var usernameText: String? {
        loginView.usernameTextField.text
    }
    
    var passwordText: String? {
        loginView.passwordTextField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyle()
        setupLayout()
    }
}

extension LoginViewController {
    func setupStyle() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.configuration = .filled()
        signInButton.addTarget(self, action: #selector(handleSignIn), for: .touchUpInside)
        
        errorText.translatesAutoresizingMaskIntoConstraints = false
        errorText.textColor = .systemRed
        errorText.textAlignment = .center
        errorText.numberOfLines = 0
        errorText.isHidden = true
        errorText.text = "Invalid email or password"
    }


    func setupLayout() {
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorText)
        
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            errorText.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 1),
            errorText.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorText.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
    }
}

extension LoginViewController {
    @objc func handleSignIn() {
        errorText.isHidden = true
        
        guard let username = usernameText, let password = passwordText else {
            showErrorMessage(withMessage: "Username / password can not be nil!")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            showErrorMessage(withMessage: "Username / password can not be blank!")
            return
        }
        
        if username == "cesar" && password == "12345" {
            signInButton.configuration?.showsActivityIndicator = true
            signInButton.configuration?.imagePadding = 6
            delegate?.didLogin()
            
        } else {
            showErrorMessage(withMessage: "Username / password incorrect!")
        }
        
        return
    }
    
    private func showErrorMessage(withMessage message: String) {
        errorText.text = message
        errorText.isHidden = false
    }
}
