//
//  ViewController.swift
//  UIKitInstagram
//
//  Created by Maxim on 17.10.2022.
//

import UIKit

/// Контроллер домашней страницы
final class HomeViewController: UIViewController {
    
    // MARK: - Private Constants
    private enum Constants {
        static let indentifierHistoryCell = "HistoryCell"
        static let indentifierPostCell = "PostCell"
        static let indentifierRecommendationCell = "RecommendationCell"
    }
    
    private enum TableCellsTyps {
        case historyCell
        case postCell
        case recommendationCell
    }
    
    // MARK: - Private IBOutlet
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Private Properties
    private var refreshControl = UIRefreshControl()
    private var tableCellsTyps: [TableCellsTyps] = [.historyCell, .postCell, .recommendationCell,
                                                    .postCell, .postCell, .postCell]
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
 
    // MARK: - Private Methods
    private func setupUI() {
        createTableView()
        createRefreshControl()
    }
    
    private func createTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func createRefreshControl() {
        refreshControl.addTarget(self, action: #selector(handleRefreshAction), for: .valueChanged)
        tableView.addSubview(refreshControl)
        refreshControl.tintColor = .white
    }
    
    // MARK: - Private objc Methods
    @objc private func handleRefreshAction() {
        refreshControl.endRefreshing()
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableCellsTyps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableCellsTyps[indexPath.row] {
        case .historyCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.indentifierHistoryCell,
                                                     for: indexPath)
            return cell
        case .postCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.indentifierPostCell,
                                                     for: indexPath)
            return cell
        case .recommendationCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.indentifierRecommendationCell,
                                                     for: indexPath)
            return cell
        }
    }
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
