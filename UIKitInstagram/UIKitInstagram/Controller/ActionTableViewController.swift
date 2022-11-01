//
//  ActionTableViewController.swift
//  UIKitInstagram
//
//  Created by Maxim on 19.10.2022.
//

import UIKit

/// Контроллер таблицы вкладки "Действия"
final class ActionTableViewController: UITableViewController {
    
    // MARK: - Private Constants
    private enum Constants {
        static let fontOneName = "Helvetica-Bold"
        static let fontTwoName = "Helvetica"
        static let requestText = "Запросы на подписку"
        static let todayText = "Сегодня"
        static let lastWeekText = "На прошлой неделе"
        static let lastMonthText = "В прошлом месяце"
        static let previouslyText = "Ранее"
        static let indentifierCommentCell = "CommentCell"
        static let indentifierSubscribeCell = "SubscribeCell"
        static let commentText = Comment(lineText: "Аватарка просто супер, где нашел? ",
                                         nameText: "master777",
                                         hourText: "5 ч.",
                                         avatarImageName: "Image",
                                         photoImageName: "Pic", isSubscribe: nil)
        static let commentTextTwo = Comment(lineText: "Классное фото! Ходил в Третьяковку?",
                                            nameText: "ikra_29",
                                            hourText: "8 ч.",
                                            avatarImageName: "Ellipse",
                                            photoImageName: "Photo", isSubscribe: nil)
        static let commentTextThree = Comment(lineText: "Мур!",
                                              nameText: "mMmMm",
                                              hourText: "10 ч.",
                                              avatarImageName: "Profile 1-4",
                                              photoImageName: "Photo", isSubscribe: nil)
        static let subscribeTextOne = Comment(lineText: "есть в Instagram. Вы можете знать этого человека",
                                              nameText: "Lady",
                                              hourText: "1 мес.",
                                              avatarImageName: "Profile 1", photoImageName: nil,
                                              isSubscribe: true)
        static let subscribeTextTwo = Comment(lineText: "подписался(-ась) на ваши обновления",
                                              nameText: "Urban",
                                              hourText: "1 мес.",
                                              avatarImageName: "Profile 1-2", photoImageName: nil,
                                              isSubscribe: false)
    }
    
    private enum TableSectionTypes {
        case request
        case today
        case lastWeek
        case lastMonth
        case previously
    }
    
    // MARK: - Private Visual Components
    private let requestTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = Constants.requestText
        label.font = UIFont(name: Constants.fontTwoName, size: 20)
        return label
    }()
    
    private let todayTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = Constants.todayText
        label.font = UIFont(name: Constants.fontOneName, size: 20)
        return label
    }()
    
    private let lastWeekTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = Constants.lastWeekText
        label.font = UIFont(name: Constants.fontOneName, size: 20)
        return label
    }()
    
    private let lastMonthTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = Constants.lastMonthText
        label.font = UIFont(name: Constants.fontOneName, size: 20)
        return label
    }()
    
    private let previouslyTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = Constants.previouslyText
        label.font = UIFont(name: Constants.fontOneName, size: 20)
        return label
    }()
    
    // MARK: - Private Properties
    private var doingRefreshControl = UIRefreshControl()
    private var sectionTypes: [TableSectionTypes] = [.request, .today, .lastWeek, .lastMonth, .previously]
    private var commentCaseToday = [Constants.commentText, Constants.commentTextTwo]
    private var commentCaseLastWeek = [Constants.commentText, Constants.commentTextTwo,
                                       Constants.subscribeTextOne, Constants.commentTextThree]
    private var subscribeCaseLastMonth = [Constants.subscribeTextOne, Constants.subscribeTextTwo]
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
    
    @objc private func handleRefreshAction() {
        doingRefreshControl.endRefreshing()
    }
    
    // MARK: - Table view data source, delegate
    override func numberOfSections(in tableView: UITableView) -> Int {
        sectionTypes.count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch sectionTypes[section] {
        case .request:
            return requestTitleLabel
        case .today:
            return todayTitleLabel
        case .lastWeek:
            return lastWeekTitleLabel
        case .lastMonth:
            return lastMonthTitleLabel
        case .previously:
            return previouslyTitleLabel
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
        case .lastMonth:
            return subscribeCaseLastMonth.count
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
            let item = commentCaseLastWeek[indexPath.row]
            if item.isSubscribe != nil {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.indentifierSubscribeCell,
                                                               for: indexPath) as? SubscribeTableViewCell
                else { return UITableViewCell() }
                cell.refresh(item)
                return cell
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.indentifierCommentCell,
                                                               for: indexPath) as? CommentTableViewCell
                else { return UITableViewCell() }
                cell.refresh(item)
                return cell
            }
        case .lastMonth:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.indentifierSubscribeCell,
                                                           for: indexPath) as? SubscribeTableViewCell
            else { return UITableViewCell() }
            let item = subscribeCaseLastMonth[indexPath.row]
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
        UITableView.automaticDimension
    }
}
