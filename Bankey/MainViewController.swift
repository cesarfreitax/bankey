//
//  MainViewController.swift
//  Bankey
//
//  Created by Bento, Cesar on 25/04/25.
//

import UIKit

class MainViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        let summaryVC = SummaryViewController()
        let moveMoneyVC = MoveMoneyViewController()
        let moreVC = MoreViewController()
        
        summaryVC.setTabBarImage(imageName: "list.dash.header.rectangle", title: "Summary")
        moveMoneyVC.setTabBarImage(imageName: "arrow.left.arrow.right", title: "Move Money")
        moreVC.setTabBarImage(imageName: "ellipsis", title: "More")
        
        let summaryNC = UINavigationController(rootViewController: summaryVC)
        let moveMoneyNC = UINavigationController(rootViewController: moveMoneyVC)
        let moreNC = UINavigationController(rootViewController: moreVC)
        
        summaryNC.navigationBar.barTintColor = appColor
        hideNavigationBarLine(navigationBar: summaryNC.navigationBar)
        
        let tabBarList = [summaryNC, moveMoneyNC, moreNC]
        viewControllers = tabBarList
    }
    
    private func hideNavigationBarLine(navigationBar: UINavigationBar) {
        let img = UIImage()
        navigationBar.shadowImage = img
        navigationBar.setBackgroundImage(img, for: .default)
        navigationBar.isTranslucent = false
    }
    
    private func setupTabBar() {
//        tabBar.tintColor = .black
//        tabBar.isTranslucent = false
    }
}

class MoveMoneyViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Move Money"
        view.backgroundColor = .systemGreen
    }
}

class MoreViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "More"
        view.backgroundColor = .systemYellow
    }
}
