//
//  SummaryViewController.swift
//  Bankey
//
//  Created by Bento, Cesar on 25/04/25.
//

import UIKit

class SummaryViewController: UIViewController { 
    
    var accounts: [SummaryCell.ViewModel] = []
    var tableView = UITableView()
    
    lazy var logoutBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutTapped))
        barButtonItem.tintColor = .label
        return barButtonItem
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setupNavigationBar() {
        navigationItem.rightBarButtonItem = logoutBarButtonItem
    }
}

extension SummaryViewController {
    private func setup() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        setupNavigationBar()
        setupTableView()
        setupTableHeaderView()
        fetchData()
    }
    
    private func setupTableView() {
        tableView.backgroundColor = appColor
        tableView.delegate = self
        tableView.dataSource = self
        
        view.backgroundColor = appColor
        
        tableView.register(SummaryCell.self, forCellReuseIdentifier: SummaryCell.reuseID)
        tableView.rowHeight = SummaryCell.rowHeight
        tableView.tableFooterView = UIView()
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension SummaryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard !accounts.isEmpty else {
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SummaryCell.reuseID, for: indexPath) as! SummaryCell
        let account = accounts[indexPath.row]
        cell.configure(with: account)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts.count
    }
}

extension SummaryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    }


    private func setupTableHeaderView() {
        let header = SummaryHeaderView(frame: .zero)
        
        var size = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        size.width = UIScreen.main.bounds.width
        header.frame.size = size
        
        tableView.tableHeaderView = header
    }
}

extension SummaryViewController {
    private func fetchData() {
        let savings = SummaryCell.ViewModel(accountType: .Banking,
                                                                accountName: "Basic Savings",
                                                            balance: 929466.23)
            let chequing = SummaryCell.ViewModel(accountType: .Banking,
                                                        accountName: "No-Fee All-In Chequing",
                                                        balance: 17562.44)
            let visa = SummaryCell.ViewModel(accountType: .CreditCard,
                                                           accountName: "Visa Avion Card",
                                                           balance: 412.83)
            let masterCard = SummaryCell.ViewModel(accountType: .CreditCard,
                                                           accountName: "Student Mastercard",
                                                           balance: 50.83)
            let investment1 = SummaryCell.ViewModel(accountType: .Investment,
                                                           accountName: "Tax-Free Saver",
                                                           balance: 2000.00)
            let investment2 = SummaryCell.ViewModel(accountType: .Investment,
                                                           accountName: "Growth Fund",
                                                           balance: 15000.00)

            accounts.append(savings)
            accounts.append(chequing)
            accounts.append(visa)
            accounts.append(masterCard)
            accounts.append(investment1)
            accounts.append(investment2)
        }
}

extension SummaryViewController {
    @objc func logoutTapped(sender: UIButton) {
        NotificationCenter.default.post(name: .logout, object: nil)
    }
}

