//
//  SummaryViewController.swift
//  Bankey
//
//  Created by Bento, Cesar on 25/04/25.
//

import UIKit

class SummaryViewController: UIViewController {
    
    let games = [
            "Pacman",
            "Space Invaders",
            "Space Patrol",
        ]
        
        var tableView = UITableView()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setup()
        }
    }

    extension SummaryViewController {
        private func setup() {
            tableView.translatesAutoresizingMaskIntoConstraints = false
            setupTableView()
            setupTableHeaderView()
        }
        
        private func setupTableView() {
            tableView.delegate = self
            tableView.dataSource = self
            
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
            let cell = tableView.dequeueReusableCell(withIdentifier: SummaryCell.reuseID, for: indexPath) as! SummaryCell
            return cell
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return games.count
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
