//
//  ActionTableViewController.swift
//  UIKitInstagram
//
//  Created by Maxim on 19.10.2022.
//

import UIKit

/// Контроллер таблицы вкладки "Действия"
final class ActionTableViewController: UITableViewController {

    // MARK: - Constants
    enum Constants {
        static let fontName = "Helvetica-Bold"
        static let indentifierRequestCell = "RequestCell"
        static let titleText = Comments(lineOne: "Запросы на подписку", lineTwo: "")
    }
    
    // MARK: - Private IBOutlet
    // MARK: - Private Properties
    private var doingRefreshControl = UIRefreshControl()
    private var tableCells: [Comments] = [Comments]()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        createLeftBarButtonItem()
        createDoingRefreshControl()
        createTable()
    }
    
    private func createLeftBarButtonItem() {
        navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.font:
                                                                    UIFont(name: Constants.fontName,
                                                                           size: 25) as Any],
                                                                 for: .normal)
    }
    
    private func createDoingRefreshControl() {
        doingRefreshControl.addTarget(self, action: #selector(handleRefreshAction), for: .valueChanged)
        tableView.addSubview(doingRefreshControl)
        doingRefreshControl.tintColor = .white
    }
    
    private func createTable() {
        let titleText = Constants.titleText
        tableCells.append(titleText)
    }
    
    // MARK: - Private objc Methods
    @objc private func handleRefreshAction() {
        doingRefreshControl.endRefreshing()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableCells.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.indentifierRequestCell,
                                                    for: indexPath) as? RequestTableViewCell {
            let item = tableCells[indexPath.row]
            
            cell.refresh(item)
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
