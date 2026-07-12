//
//  HomeVC.swift
//  LiquidBank
//
//  Created by Trainee on 03/07/2026.
//

import UIKit

class HomeVC: UIViewController {
    let scrollView = UIScrollView()
    let contentView = UIView()
    let greeting = UILabel()
    let userName = UILabel()
    let notificationButton = UIButton()
    let visaCard = UIView()
    let vStack = UIStackView()
    let availabelBalance = UILabel()
    let balanceAmount = UILabel()
    let visaCardNumber = UILabel()
    let row = UIStackView()
    let circle = UIImageView(image: UIImage(named: "circle"))
    let cardType = UIButton()
    let transferItem = ActionItemView(
        title: "Transfer",
        iconName: "arrow.left.arrow.right"
    )

    let payBillsItem = ActionItemView(title: "Pay Bills", iconName: "doc.text")
    let topUpItem = ActionItemView(title: "Top-up", iconName: "plus")
    let moreItem = ActionItemView(title: "More", iconName: "ellipsis")
    let myCards = UILabel()
    let seeAll = UIButton()
    let cardStack = UIStackView()
    let rowActions = UIStackView()

    let cardLayout = UICollectionViewFlowLayout()
    lazy var cardCollection: UICollectionView = {
        cardLayout.scrollDirection = .horizontal
        cardLayout.minimumLineSpacing = 26
        cardLayout.itemSize = CGSize(width: 180, height: 104)

        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: cardLayout
        )

        return collectionView
    }()

    let recentTransactions = UILabel()
    let seeAllTransactions = UIButton()
    //    let trasnaction = UIStackView()

    let transactionsTableView = UITableView()

    var transactions: [Transaction] = []
    override func viewDidLoad() {

        super.viewDidLoad()
        setupUI()
        setupHierarchy()
        setupLayout()
        fetchTransactions()

    }

    func setupUI() {

        view.backgroundColor = UIColor(named: "bgColor")
        configGreeting()
        conifgUserName()
        configNotificationButton()
        configVisaCard()
        configVstack()
        configAvailabelBalance()
        configBalanceAmount()
        configVisaCardNumber()
        configRow()
        configCardType()
        configCircle()
        configRowActions()
        configMyCards()
        configSeeAllButton()
        configCardStack()
        configCardCollectionView()
        configRecentTransactions()
        configSeeAllTransactions()
        configTransactionsTableView()
        configScrollView()

    }

    func setupHierarchy() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        contentView.addSubview(greeting)
        contentView.addSubview(userName)
        contentView.addSubview(notificationButton)
        contentView.addSubview(visaCard)
        contentView.addSubview(vStack)
        visaCard.addSubview(circle)
        visaCard.addSubview(vStack)
        contentView.addSubview(rowActions)
        contentView.addSubview(cardStack)
        contentView.addSubview(cardCollection)
        contentView.addSubview(transactionsTableView)
        contentView.addSubview(recentTransactions)
        contentView.addSubview(seeAllTransactions)
    }

    func setupLayout() {

        NSLayoutConstraint.activate(
            [
                scrollView.topAnchor.constraint(
                    equalTo: view.safeAreaLayoutGuide.topAnchor
                ),
                scrollView.leadingAnchor.constraint(
                    equalTo: view.leadingAnchor
                ),
                scrollView.trailingAnchor.constraint(
                    equalTo: view.trailingAnchor
                ),
                scrollView.bottomAnchor.constraint(
                    equalTo: view.bottomAnchor
                ),

                contentView.topAnchor.constraint(
                    equalTo: scrollView.contentLayoutGuide.topAnchor
                ),
                contentView.leadingAnchor.constraint(
                    equalTo: scrollView.contentLayoutGuide.leadingAnchor
                ),
                contentView.trailingAnchor.constraint(
                    equalTo: scrollView.contentLayoutGuide.trailingAnchor
                ),
                contentView.bottomAnchor.constraint(
                    equalTo: scrollView.contentLayoutGuide.bottomAnchor
                ),
                contentView.widthAnchor.constraint(
                    equalTo: scrollView.frameLayoutGuide.widthAnchor
                ),

                greeting.topAnchor.constraint(
                    equalTo: contentView.topAnchor,

                ),
                greeting.leadingAnchor.constraint(
                    equalTo: contentView.leadingAnchor,
                    constant: 20
                ),

                userName.topAnchor.constraint(
                    equalTo: greeting.bottomAnchor,
                    constant: 4
                ),

                userName.leadingAnchor.constraint(
                    equalTo: contentView.leadingAnchor,
                    constant: 20
                ),

                notificationButton.trailingAnchor.constraint(
                    equalTo: contentView.trailingAnchor,
                    constant: -20
                ),
                notificationButton.widthAnchor.constraint(equalToConstant: 40),
                notificationButton.heightAnchor.constraint(equalToConstant: 40),
                notificationButton.topAnchor.constraint(
                    equalTo: contentView.topAnchor
                ),

                cardStack.topAnchor.constraint(
                    equalTo: rowActions.bottomAnchor,
                    constant: 23
                ),
                cardStack.leadingAnchor.constraint(
                    equalTo: contentView.leadingAnchor,
                    constant: 20
                ),
                cardStack.trailingAnchor.constraint(
                    equalTo: contentView.trailingAnchor,
                    constant: -20
                ),

                visaCard.topAnchor.constraint(
                    equalTo: userName.bottomAnchor,
                    constant: 14
                ),
                visaCard.leadingAnchor.constraint(
                    equalTo: contentView.leadingAnchor,
                    constant: 20
                ),
                visaCard.trailingAnchor.constraint(
                    equalTo: contentView.trailingAnchor,
                    constant: -20
                ),

                visaCard.heightAnchor.constraint(equalToConstant: 162),

                vStack.topAnchor.constraint(
                    equalTo: visaCard.topAnchor,
                    constant: 25
                ),
                vStack.leadingAnchor.constraint(
                    equalTo: visaCard.leadingAnchor,
                    constant: 24
                ),
                vStack.trailingAnchor.constraint(
                    equalTo: visaCard.trailingAnchor,
                    constant: -20
                ),
                cardType.widthAnchor.constraint(equalToConstant: 52),
                cardType.heightAnchor.constraint(equalToConstant: 29),

                circle.trailingAnchor.constraint(
                    equalTo: visaCard.trailingAnchor,
                    constant: 0
                ),
                circle.topAnchor.constraint(
                    equalTo: visaCard.topAnchor,
                    constant: 0
                ),
                circle.widthAnchor.constraint(equalToConstant: 100),
                circle.heightAnchor.constraint(equalToConstant: 100),

                rowActions.topAnchor.constraint(
                    equalTo: visaCard.bottomAnchor,
                    constant: 24
                ),
                rowActions.leadingAnchor.constraint(
                    equalTo: contentView.leadingAnchor,
                    constant: 20
                ),
                rowActions.trailingAnchor.constraint(
                    equalTo: contentView.trailingAnchor,
                    constant: -20
                ),
                myCards.topAnchor.constraint(
                    equalTo: rowActions.bottomAnchor,
                    constant: 23
                ),
                myCards.leadingAnchor.constraint(
                    equalTo: contentView.leadingAnchor,
                    constant: 20
                ),

                rowActions.heightAnchor.constraint(equalToConstant: 90),

                cardStack.leadingAnchor.constraint(
                    equalTo: contentView.leadingAnchor,
                    constant: 20
                ),
                cardStack.trailingAnchor.constraint(
                    equalTo: contentView.trailingAnchor,
                    constant: -20
                ),
                cardCollection.topAnchor.constraint(
                    equalTo: myCards.bottomAnchor,
                    constant: 12
                ),
                cardCollection.leadingAnchor.constraint(
                    equalTo: contentView.leadingAnchor,
                    constant: 20
                ),
                cardCollection.trailingAnchor.constraint(
                    equalTo: contentView.trailingAnchor,
                    constant: -20
                ),
                cardCollection.heightAnchor.constraint(equalToConstant: 110),

                recentTransactions.topAnchor.constraint(
                    equalTo: cardCollection.bottomAnchor,
                    constant: 36
                ),

                recentTransactions.leadingAnchor.constraint(
                    equalTo: contentView.leadingAnchor,
                    constant: 20
                ),

                seeAllTransactions.topAnchor.constraint(
                    equalTo: cardCollection.bottomAnchor,
                    constant: 36
                ),

                seeAllTransactions.trailingAnchor.constraint(
                    equalTo: contentView.trailingAnchor,
                    constant: -20
                ),

                transactionsTableView.topAnchor.constraint(
                    equalTo: recentTransactions.bottomAnchor,
                    constant: 10
                ),
                transactionsTableView.leadingAnchor.constraint(
                    equalTo: contentView.leadingAnchor,
                    constant: 20
                ),
                transactionsTableView.trailingAnchor.constraint(
                    equalTo: contentView.trailingAnchor,
                    constant: -20
                ),
                transactionsTableView.bottomAnchor.constraint(
                    equalTo: contentView.bottomAnchor,
                    constant: -20                ),
                
                transactionsTableView.heightAnchor.constraint(equalToConstant: 275)

            ]

        )
    }

    func configGreeting() {
        greeting.text = "Good Morning"
        greeting.font = .systemFont(ofSize: 13.5)
        greeting.textColor = UIColor(named: "greyGreeting")
        greeting.translatesAutoresizingMaskIntoConstraints = false
    }

    func conifgUserName() {

        userName.text = "Ahmed Hassan"
        userName.font = .systemFont(ofSize: 18, weight: .bold)
        userName.textColor = UIColor(named: "darkblue")
        userName.translatesAutoresizingMaskIntoConstraints = false
    }

    func configNotificationButton() {

        notificationButton.translatesAutoresizingMaskIntoConstraints = false
        notificationButton.setImage(UIImage(systemName: "bell", ), for: .normal)
        notificationButton.backgroundColor = .white
        notificationButton.layer.cornerRadius = 20
        notificationButton.tintColor = UIColor(named: "darkblue")

    }

    func configVisaCard() {
        visaCard.translatesAutoresizingMaskIntoConstraints = false
        visaCard.backgroundColor = UIColor(named: "visaCardBgColor")
        visaCard.layer.cornerRadius = 24

        visaCard.clipsToBounds = true

    }

    func configAvailabelBalance() {

        availabelBalance.text = "Availabel Balance"
        availabelBalance.font = .systemFont(ofSize: 12)
        availabelBalance.textColor = .white
        availabelBalance.translatesAutoresizingMaskIntoConstraints = false
        availabelBalance.layer.opacity = 0.65
    }

    func configBalanceAmount() {

        balanceAmount.text = "$24,580.00"
        balanceAmount.font = .systemFont(ofSize: 28, weight: .bold)
        balanceAmount.textColor = .white
        balanceAmount.translatesAutoresizingMaskIntoConstraints = false

    }

    func configVisaCardNumber() {
        visaCardNumber.translatesAutoresizingMaskIntoConstraints = false
        visaCardNumber.text = "•••• •••• •••• 4821"
        visaCardNumber.font = .systemFont(ofSize: 12)
        visaCardNumber.textColor = .white
        visaCardNumber.layer.opacity = 0.65
    }

    func configCardType() {

        cardType.setTitle("Visa", for: .normal)
        cardType.titleLabel?.font = .systemFont(ofSize: 13, weight: .bold)
        cardType.backgroundColor = .white.withAlphaComponent(0.1)
        cardType.layer.cornerRadius = 8

    }
    func configCircle() {
        circle.translatesAutoresizingMaskIntoConstraints = false
    }

    func configScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.alwaysBounceVertical = true
    }
    func configRow() {
        row.translatesAutoresizingMaskIntoConstraints = false
        row.isLayoutMarginsRelativeArrangement = true

        row.alignment = .fill
        row.distribution = .fill

        row.axis = .horizontal
        row.addArrangedSubview(visaCardNumber)
        row.addArrangedSubview(cardType)
    }

    func configVstack() {
        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.isLayoutMarginsRelativeArrangement = true
        vStack.axis = .vertical

        vStack.addArrangedSubview(availabelBalance)
        vStack.addArrangedSubview(balanceAmount)
        vStack.addArrangedSubview(row)
        vStack.alignment = .fill
        vStack.distribution = .fill
        vStack.spacing = 12

        vStack.setCustomSpacing(28.5, after: balanceAmount)
    }

    func configRowActions() {
        rowActions.translatesAutoresizingMaskIntoConstraints = false

        rowActions.axis = .horizontal
        rowActions.spacing = 12
        rowActions.distribution = .fillEqually
        rowActions.alignment = .fill
        rowActions.addArrangedSubview(transferItem)
        rowActions.addArrangedSubview(payBillsItem)
        rowActions.addArrangedSubview(topUpItem)
        rowActions.addArrangedSubview(moreItem)

    }

    func configMyCards() {
        myCards.text = "My Cards"
        myCards.textColor = UIColor(named: "darkblue")
        myCards.font = .systemFont(ofSize: 16, weight: .bold)
        myCards.translatesAutoresizingMaskIntoConstraints = false
    }

    func configSeeAllButton() {
        seeAll.translatesAutoresizingMaskIntoConstraints = false

        seeAll.setTitle("See All", for: .normal)
        seeAll.setTitleColor(UIColor(named: "buttonColor"), for: .normal)
        seeAll.titleLabel?.font = .systemFont(ofSize: 13, weight: .bold)

    }

    func configRecentTransactions() {
        recentTransactions.text = "Recent Transactions"
        recentTransactions.textColor = UIColor(named: "darkblue")
        recentTransactions.font = .systemFont(ofSize: 16, weight: .bold)
        recentTransactions.translatesAutoresizingMaskIntoConstraints = false
    }

    func configSeeAllTransactions() {
        seeAllTransactions.translatesAutoresizingMaskIntoConstraints = false

        seeAllTransactions.setTitle("See All", for: .normal)
        seeAllTransactions.setTitleColor(
            UIColor(named: "buttonColor"),
            for: .normal
        )
        seeAllTransactions.titleLabel?.font = .systemFont(
            ofSize: 13,
            weight: .bold
        )

    }

    func configCardStack() {

        cardStack.axis = .horizontal
        cardStack.distribution = .fill
        cardStack.alignment = .fill

        cardStack.addArrangedSubview(myCards)
        cardStack.addArrangedSubview(seeAll)
        cardStack.isLayoutMarginsRelativeArrangement = true
        cardStack.translatesAutoresizingMaskIntoConstraints = false
    }

    func configCardCollectionView() {
        cardCollection.translatesAutoresizingMaskIntoConstraints = false
        cardCollection.backgroundColor = .clear
        cardCollection.showsHorizontalScrollIndicator = false

        cardCollection.register(
            BankCardCell.self,
            forCellWithReuseIdentifier: BankCardCell.identifier
        )

        cardCollection.dataSource = self
    }

    func configTransactionsTableView() {
        transactionsTableView.translatesAutoresizingMaskIntoConstraints = false
        transactionsTableView.dataSource = self
        transactionsTableView.delegate = self
        transactionsTableView.layer.cornerRadius = 18
        transactionsTableView.isScrollEnabled = false
        transactionsTableView.register(
            CustomTableViewCell.self,
            forCellReuseIdentifier: "TransactionCell"
        )

    }

    func fetchTransactions() {
        NetworkManager.shared.fetchTransactions { [weak self] result in

            DispatchQueue.main.async {
                switch result {
                case .success(let fetchedTransactions):
                    self?.transactions = fetchedTransactions
                    self?.transactionsTableView.reloadData()

                case .failure(let error):
                    print("Erros on Fetching", error.localizedDescription)
                }
            }
        }
    }
}

extension HomeVC: UICollectionViewDataSource {

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return 2
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell =
            collectionView.dequeueReusableCell(
                withReuseIdentifier: BankCardCell.identifier,
                for: indexPath
            ) as! BankCardCell

        return cell
    }
}

extension HomeVC: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int
    {
        return transactions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell
    {

        let cell =
            tableView.dequeueReusableCell(
                withIdentifier: "TransactionCell",
                for: indexPath
            ) as! CustomTableViewCell

        let currentTransaction = transactions[indexPath.row]

        cell.configure(with: currentTransaction)

        return cell
    }

    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        return 70
    }

    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        tableView.deselectRow(at: indexPath, animated: true)

        let clickedTransaction = transactions[indexPath.row]

        let detailsVC = TransactionDetails()

        detailsVC.selectedTransaction = clickedTransaction

        navigationController?.pushViewController(detailsVC, animated: true)
    }
}
