//
//  SearchViewController.swift
//  UIKitInstagram
//
//  Created by Maxim on 22.10.2022.
//

import UIKit

/// Контроллер  страницы поиска
final class SearchViewController: UIViewController {
    
    // MARK: - Private Constants
    private enum Constants {
        static let indentifierStatisticsUserCell = "StatisticsUserCell"
        static let indentifierInfoUserCell = "InfoUserCell"
        static let indentifierActualCell = "ActualCell"
        static let indentifierMediaUserCell = "MediaUserCell"
        static let userName = "elonmuskrus"
    }
    
    private enum TableCellsTyps {
        case statisticsUserCell
        case infoUserCell
        case actualCell
        case mediaUserCell
    }
    
    // MARK: - Private IBOutlet
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Private Properties
    private var refreshControl = UIRefreshControl()
    private var tableCellsTyps: [TableCellsTyps] = [.statisticsUserCell, .infoUserCell,
                                                    .actualCell, .mediaUserCell]
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        createBarButtonItem()
        createTableView()
        createRefreshControl()
    }
    
    private func createTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func createBarButtonItem() {
        navigationItem.title = Constants.userName
        navigationController?.navigationBar.titleTextAttributes =
        [NSAttributedString.Key.foregroundColor: UIColor.white]
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
extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableCellsTyps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let type = tableCellsTyps[indexPath.row]
        switch type {
        case .statisticsUserCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.indentifierStatisticsUserCell,
                                                     for: indexPath)
            return cell
        case .infoUserCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.indentifierInfoUserCell,
                                                     for: indexPath)
            return cell
        case .actualCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.indentifierActualCell,
                                                     for: indexPath)
            return cell
        case .mediaUserCell:
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.indentifierMediaUserCell,
                                                     for: indexPath)
            return cell
        }
    }
}

// MARK: - UITableViewDelegate
extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
