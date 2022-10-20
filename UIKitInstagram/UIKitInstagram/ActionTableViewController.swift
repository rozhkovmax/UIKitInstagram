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
        static let fontOneName = "Helvetica-Bold"
        static let fontTwoName = "Helvetica"
        static let requestText = "Запросы на подписку"
        static let todayText = "Сегодня"
        static let lastWeekText = "На прошлой неделе"
        static let previouslyText = "Ранее"
        static let indentifierCommentCell = "CommentCell"
        static let commentText = Comments(textLine: "Классное фото!", nameText: "master777",
                                          hourText: "5 ч.", avatarImge: "Image", photoImage: "Pic")
        static let commentTextTwo = Comments(textLine: "Класс!!!", nameText: "ikra_29",
                                             hourText: "8 ч.", avatarImge: "Image", photoImage: "Photo")
        static let commentTextThree = Comments(textLine: "Ура!", nameText: "mMmMm",
                                               hourText: "10 ч.", avatarImge: "Image", photoImage: "Photo")
    }
    
    enum TableSectionTypes {
        case request
        case today
        case lastWeek
        case previously
    }
    
    // MARK: - Private Properties
    private var doingRefreshControl = UIRefreshControl()
    private var sectionTypes: [TableSectionTypes] = [.request, .today, .lastWeek, .previously]
    private var commentCaseToday = [Constants.commentText, Constants.commentTextTwo]
    private var commentCaseLastWeek = [Constants.commentText, Constants.commentTextTwo,
                                       Constants.commentTextThree]
    private var commentCasePreviously = [Constants.commentText, Constants.commentTextTwo,
                                         Constants.commentTextThree, Constants.commentText]
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        createLeftBarButtonItem()
        createDoingRefreshControl()
    }
    
    private func createLeftBarButtonItem() {
        navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.font:
                                                                    UIFont(name: Constants.fontOneName,
                                                                           size: 25) as Any],
                                                                 for: .normal)
    }
    
    private func createDoingRefreshControl() {
        doingRefreshControl.addTarget(self, action: #selector(handleRefreshAction), for: .valueChanged)
        tableView.addSubview(doingRefreshControl)
        doingRefreshControl.tintColor = .white
    }
    
    // MARK: - Private objc Methods
    @objc private func handleRefreshAction() {
        doingRefreshControl.endRefreshing()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTypes.count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch sectionTypes[section] {
        case .request:
            let headerTitle = UILabel()
            headerTitle.textColor = .white
            headerTitle.text = Constants.requestText
            headerTitle.font = UIFont(name: Constants.fontTwoName, size: 20)
            return headerTitle
        case .today:
            let headerTitle = UILabel()
            headerTitle.textColor = .white
            headerTitle.text = Constants.todayText
            headerTitle.font = UIFont(name: Constants.fontOneName, size: 20)
            return headerTitle
        case .lastWeek:
            let headerTitle = UILabel()
            headerTitle.textColor = .white
            headerTitle.text = Constants.lastWeekText
            headerTitle.font = UIFont(name: Constants.fontOneName, size: 20)
            return headerTitle
        case .previously:
            let headerTitle = UILabel()
            headerTitle.textColor = .white
            headerTitle.text = Constants.previouslyText
            headerTitle.font = UIFont(name: Constants.fontOneName, size: 20)
            return headerTitle
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch sectionTypes[section] {
        case .request:
            return 0
        case .today:
            return commentCaseToday.count
        case .lastWeek:
            return commentCaseLastWeek.count
        case .previously:
            return commentCasePreviously.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch sectionTypes[indexPath.section] {
        case .request:
            return UITableViewCell()
        case .today:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.indentifierCommentCell,
                                                           for: indexPath) as? CommentTableViewCell
            else { return UITableViewCell() }
            let item = commentCaseToday[indexPath.row]
            cell.refresh(item)
            return cell
        case .lastWeek:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.indentifierCommentCell,
                                                           for: indexPath) as? CommentTableViewCell
            else { return UITableViewCell() }
            let item = commentCaseLastWeek[indexPath.row]
            cell.refresh(item)
            return cell
        case .previously:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.indentifierCommentCell,
                                                           for: indexPath) as? CommentTableViewCell
            else { return UITableViewCell() }
            let item = commentCasePreviously[indexPath.row]
            cell.refresh(item)
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch sectionTypes[indexPath.row] {
        case .request:
            return UITableView.automaticDimension
        case .today:
            return UITableView.automaticDimension
        case .lastWeek:
            return UITableView.automaticDimension
        case .previously:
            return UITableView.automaticDimension
        }
    }
}
