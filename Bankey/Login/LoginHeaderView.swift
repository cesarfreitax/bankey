//
//  LoginHeaderView.swift
//  Bankey
//
//  Created by Bento, Cesar on 30/05/25.
//

import UIKit

class LoginHeaderView: UIView {
    let screenTitle = UILabel()
    let screenSubtitle = UILabel()
    let stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStyle()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginHeaderView {
    func setupStyle() {
        translatesAutoresizingMaskIntoConstraints = false
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 4
        
        screenTitle.translatesAutoresizingMaskIntoConstraints = false
        screenTitle.text = "Bankey"
        screenTitle.font = .systemFont(ofSize: 24, weight: .regular)
        screenTitle.textAlignment = .center
        
        screenSubtitle.translatesAutoresizingMaskIntoConstraints = false
        screenSubtitle.text = "Start using the best banking app ever"
        screenSubtitle.textAlignment = .center
    }
    
    func setupLayout() {
        stackView.addArrangedSubview(screenTitle)
        stackView.addArrangedSubview(screenSubtitle)
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
        ])
            
    }
}
