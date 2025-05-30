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
    let loginHeaderView = LoginHeaderView()
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
    
    // Animation
    var leadingEdgeOnScreen: CGFloat = 16
    var leadingEdgeOffScreen: CGFloat = -1000
    
    var headerLeadingAnchor: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyle()
        setupLayout()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        signInButton.configuration?.showsActivityIndicator = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animate()
    }
}

extension LoginViewController {
    func setupStyle() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        loginHeaderView.titleLabelAlpha = 0
        
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
        view.addSubview(loginHeaderView)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorText)
        
        NSLayoutConstraint.activate([
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginHeaderView.trailingAnchor, multiplier: 2),
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: loginHeaderView.bottomAnchor, multiplier: 2),
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
        
        headerLeadingAnchor = loginHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingEdgeOffScreen)
        headerLeadingAnchor?.isActive = true
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

// MARK: - Animations
extension LoginViewController {
    private func animate() {
        let animator1 = UIViewPropertyAnimator(duration: 0.25, curve: .easeInOut) {
            self.headerLeadingAnchor?.constant = self.leadingEdgeOnScreen
            self.view.layoutIfNeeded()
        }
        animator1.startAnimation()
        self.view.layoutIfNeeded()
        
        let animator2 = UIViewPropertyAnimator(duration: 0.25, curve: .easeInOut) {
            self.loginHeaderView.titleLabelAlpha = 1
            self.view.layoutIfNeeded()
        }
        animator2.startAnimation(afterDelay: 0.2)
    }
}
