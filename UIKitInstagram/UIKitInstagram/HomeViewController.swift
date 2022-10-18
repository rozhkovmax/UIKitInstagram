//
//  ViewController.swift
//  UIKitInstagram
//
//  Created by Maxim on 17.10.2022.
//

import UIKit

/// Контроллер домашней страницы
final class HomeViewController: UIViewController {
    
    // MARK: - Constants
    enum Constants {
        static let indentifierHistoryCellText = "HistoryCell"
        static let indentifierPostCellText = "PostCell"
        static let indentifierRecommendationCellText = "RecommendationCell"
    }
    
    // MARK: - Private IBOutlet
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Private Properties
    private let indentifierHistoryCell = Constants.indentifierHistoryCellText
    private let indentifierPostCell = Constants.indentifierPostCellText
    private let indentifierRecommendationCell = Constants.indentifierRecommendationCellText
    private var refresh = UIRefreshControl()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
 
    // MARK: - Private Methods
    private func setupUI() {
        tableView.dataSource = self
        createRefreshControl()
    }
    
    private func createRefreshControl() {
        refresh.addTarget(self, action: #selector(handleRefreshAction), for: .valueChanged)
        tableView.addSubview(refresh)
        refresh.tintColor = .white
    }
    
    // MARK: - Private objc Methods
    @objc private func handleRefreshAction() {
        refresh.endRefreshing()
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: indentifierHistoryCell, for: indexPath)
            return cell
        case 1, 3, 4, 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: indentifierPostCell, for: indexPath)
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: indentifierRecommendationCell, for: indexPath)
            return cell
        default:
            return UITableViewCell()
        }
    }
}
