//
//  OnboardingViewController.swift
//  Bankey
//
//  Created by Bento, Cesar on 04/04/25.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    let onboardingStackView = UIStackView()
    let onboardingImageView = UIImageView()
    let onboardingImageName: String
    let onboardingLabel = UILabel()
    let onboardingText: String
    
        
    init(image: String, text: String) {
        onboardingImageName = image
        onboardingText = text
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
    }
}

extension OnboardingViewController {
    private func setStyle() {
        view.backgroundColor = .systemBackground
        
        onboardingStackView.translatesAutoresizingMaskIntoConstraints = false
        onboardingStackView.axis = .vertical
        onboardingStackView.spacing = 20
        
        onboardingImageView.translatesAutoresizingMaskIntoConstraints = false
        onboardingImageView.image = UIImage(named: onboardingImageName)
        onboardingImageView.contentMode = .scaleAspectFit
        
        onboardingLabel.translatesAutoresizingMaskIntoConstraints = false
        onboardingLabel.text = onboardingText
        onboardingLabel.textAlignment = .center
        onboardingLabel.numberOfLines = 0
        onboardingLabel.adjustsFontForContentSizeCategory = true
        onboardingLabel.font = .preferredFont(forTextStyle: .title3)
        
    }
    
    private func setLayout() {
        onboardingStackView.addArrangedSubview(onboardingImageView)
        onboardingStackView.addArrangedSubview(onboardingLabel)
        view.addSubview(onboardingStackView)
        
        NSLayoutConstraint.activate([
            onboardingStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            onboardingStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            onboardingStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: onboardingStackView.trailingAnchor, multiplier: 1),
        ])
    }
}
