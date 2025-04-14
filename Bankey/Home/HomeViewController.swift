//
//  HomeViewController.swift
//  Bankey
//
//  Created by Bento, Cesar on 14/04/25.
//

import UIKit

protocol HomeViewControllerDelegate: AnyObject {
    func didLogout()
}

class HomeViewController: UIViewController {
    let stackView = UIStackView()
    let label = UILabel()
    let logoutBtn = UIButton(type: .system)
    
    weak var delegate: HomeViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
    }
}

extension HomeViewController {
    private func setStyle() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Home Screen"
        label.textAlignment = .center
        
        logoutBtn.translatesAutoresizingMaskIntoConstraints = false
        logoutBtn.setTitle("Logout", for: .normal)
        logoutBtn.addTarget(self, action: #selector(logout), for: .touchUpInside)
    }
    
    private func setLayout() {
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(logoutBtn)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}

extension HomeViewController {
    @objc private func logout() {
        delegate?.didLogout()
    }
}
