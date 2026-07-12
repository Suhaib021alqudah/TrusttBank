//
//  ViewController.swift
//  LiquidBank
//
//  Created by Trainee on 06/07/2026.

import UIKit

class TransactionDetails: UIViewController {

    let scrollView = UIScrollView()
    let contentView = UIView()
    let viewTitle = UILabel()
    let paymentView = UIView()
    let arrowView = UIView()
    let arrow = UIImageView()

    let transactionType = UILabel()
    let transactionAmount = UILabel()
    let transactionCurrencyName = UILabel()
    let transactionDate = UILabel()
    let transactionStatus = UILabel()

    let cardView = UIView()

    let descriptionCard = UIView()
    let descriptionTitle = UILabel()
    let descriptionLabel = UILabel()
    var selectedTransaction: Transaction?

    let shareButton = UIButton(type: .system)

    let tabelViewBg = UIView()

    let transactionDetailsTabelView: UITableView = {
        let tableView = UITableView()
        tableView.register(
            UITableViewCell.self,
            forCellReuseIdentifier: "TransactionDetailCell"
        )
        return tableView
    }()

    var rows: [(title: String, value: String)] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupHierarchy()
        setupLayout()

        if let transaction = selectedTransaction {
            updateUI(with: transaction)
        }
    }

    func updateUI(with transaction: Transaction) {

        transactionType.text = transaction.type.capitalized
        transactionAmount.text = transaction.amount
        transactionCurrencyName.text = transaction.currency
        transactionDate.text = transaction.createdAt
        descriptionLabel.text = transaction.description

        rows = [
            ("Account", transaction.name),
            ("Account Number", transaction.account),
            ("Transaction ID", "#\(transaction.id)"),
            ("Type", transaction.type.capitalized),
            ("Date & Time", transaction.createdAt),
        ]

        transactionDetailsTabelView.reloadData()

    }

    func setupUI() {
        view.backgroundColor = UIColor(named: "bgColor") ?? .systemBackground

        configScrollView()
        configViewTitle()
        configPaymentView()
        configArrowView()
        configArrow()
        configTransactionTypeName()
        configTransactionAmount()
        configTransactionCurrencyName()
        configTransactionDate()
        configTransactionStatus()
        configTableViewBg()
        configTableView()
        configDescriptionCard()
        configDescriptionTitle()
        configDescriptionLabel()
        configShareButton()
    
    }

    func setupHierarchy() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        contentView.addSubview(viewTitle)
        contentView.addSubview(paymentView)

        paymentView.addSubview(arrowView)
        arrowView.addSubview(arrow)

        paymentView.addSubview(transactionType)
        paymentView.addSubview(transactionAmount)
        paymentView.addSubview(transactionCurrencyName)
        paymentView.addSubview(transactionDate)
        paymentView.addSubview(transactionStatus)

        contentView.addSubview(tabelViewBg)
        tabelViewBg.addSubview(transactionDetailsTabelView)
        contentView.addSubview(descriptionCard)
        descriptionCard.addSubview(descriptionTitle)
        descriptionCard.addSubview(descriptionLabel)

        contentView.addSubview(shareButton)

    }

    func setupLayout() {

        NSLayoutConstraint.activate([

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

            viewTitle.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 14
            ),
            viewTitle.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 20
            ),

            paymentView.topAnchor.constraint(
                equalTo: viewTitle.bottomAnchor,
                constant: 30
            ),
            paymentView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 20
            ),
            paymentView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -20
            ),
            paymentView.heightAnchor.constraint(
                equalToConstant: 280
            ),

            arrowView.centerXAnchor.constraint(
                equalTo: paymentView.centerXAnchor
            ),
            arrowView.topAnchor.constraint(
                equalTo: paymentView.topAnchor,
                constant: 32
            ),
            arrowView.widthAnchor.constraint(
                equalToConstant: 56
            ),
            arrowView.heightAnchor.constraint(
                equalToConstant: 56
            ),

            arrow.centerXAnchor.constraint(
                equalTo: arrowView.centerXAnchor
            ),
            arrow.centerYAnchor.constraint(
                equalTo: arrowView.centerYAnchor
            ),
            arrow.widthAnchor.constraint(
                equalToConstant: 24
            ),
            arrow.heightAnchor.constraint(
                equalToConstant: 24
            ),

            transactionType.centerXAnchor.constraint(
                equalTo: paymentView.centerXAnchor
            ),
            transactionType.topAnchor.constraint(
                equalTo: arrowView.bottomAnchor,
                constant: 16
            ),

            transactionAmount.centerXAnchor.constraint(
                equalTo: paymentView.centerXAnchor
            ),
            transactionAmount.topAnchor.constraint(
                equalTo: transactionType.bottomAnchor,
                constant: 10
            ),

            transactionCurrencyName.leadingAnchor.constraint(
                equalTo: transactionAmount.trailingAnchor,
                constant: 8
            ),
            transactionCurrencyName.bottomAnchor.constraint(
                equalTo: transactionAmount.bottomAnchor,
                constant: -5
            ),

            transactionDate.centerXAnchor.constraint(
                equalTo: paymentView.centerXAnchor
            ),
            transactionDate.topAnchor.constraint(
                equalTo: transactionAmount.bottomAnchor,
                constant: 11
            ),

            transactionStatus.topAnchor.constraint(
                equalTo: transactionDate.bottomAnchor,
                constant: 18
            ),
            transactionStatus.centerXAnchor.constraint(
                equalTo: paymentView.centerXAnchor
            ),
            transactionStatus.widthAnchor.constraint(
                equalToConstant: 120
            ),
            transactionStatus.heightAnchor.constraint(
                equalToConstant: 30
            ),

            tabelViewBg.topAnchor.constraint(
                equalTo: paymentView.bottomAnchor,
                constant: 24
            ),
            tabelViewBg.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 20
            ),

            tabelViewBg.heightAnchor.constraint(equalToConstant: 281),
            tabelViewBg.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -20
            ),

            transactionDetailsTabelView.topAnchor.constraint(
                equalTo: tabelViewBg.topAnchor
            ),
            transactionDetailsTabelView.leadingAnchor.constraint(
                equalTo: tabelViewBg.leadingAnchor,
                constant: -20
            ),
            transactionDetailsTabelView.trailingAnchor.constraint(
                equalTo: tabelViewBg.trailingAnchor,
                constant: 20
            ),
            transactionDetailsTabelView.bottomAnchor.constraint(
                equalTo: tabelViewBg.bottomAnchor
            ),

            descriptionCard.topAnchor.constraint(
                equalTo: tabelViewBg.bottomAnchor,
                constant: 20
            ),
            descriptionCard.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 20
            ),
            descriptionCard.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -20
            ),
            descriptionCard.heightAnchor.constraint(
                equalToConstant: 130
            ),

            descriptionTitle.topAnchor.constraint(
                equalTo: descriptionCard.topAnchor,
                constant: 20
            ),
            descriptionTitle.leadingAnchor.constraint(
                equalTo: descriptionCard.leadingAnchor,
                constant: 20
            ),
            descriptionTitle.trailingAnchor.constraint(
                equalTo: descriptionCard.trailingAnchor,
                constant: -20
            ),

            descriptionLabel.topAnchor.constraint(
                equalTo: descriptionTitle.bottomAnchor,
                constant: 12
            ),
            descriptionLabel.leadingAnchor.constraint(
                equalTo: descriptionCard.leadingAnchor,
                constant: 20
            ),
            descriptionLabel.trailingAnchor.constraint(
                equalTo: descriptionCard.trailingAnchor,
                constant: -20
            ),
            descriptionLabel.bottomAnchor.constraint(
                lessThanOrEqualTo: descriptionCard.bottomAnchor,
                constant: -20
            ),

            shareButton.topAnchor.constraint(
                equalTo: descriptionCard.bottomAnchor,
                constant: 17
            ),
            shareButton.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 20
            ),
            shareButton.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -20
            ),
            shareButton.heightAnchor.constraint(
                equalToConstant: 56
            ),
            shareButton.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -30
            ),
        ])
    }

    func configScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false

        scrollView.showsVerticalScrollIndicator = false
        scrollView.alwaysBounceVertical = true
    }

    func configViewTitle() {
        viewTitle.translatesAutoresizingMaskIntoConstraints = false
        viewTitle.text = "Transaction Details"
        viewTitle.textColor = UIColor(named: "darkblue") ?? .label
        viewTitle.font = .systemFont(ofSize: 20, weight: .bold)
    }

    func configPaymentView() {
        paymentView.translatesAutoresizingMaskIntoConstraints = false
        paymentView.backgroundColor = .white
        paymentView.layer.cornerRadius = 28
    }

    func configArrowView() {
        arrowView.translatesAutoresizingMaskIntoConstraints = false
        arrowView.layer.cornerRadius = 18
        arrowView.backgroundColor =
            (UIColor(named: "redViewColor") ?? .systemRed)
            .withAlphaComponent(0.10)
    }

    func configArrow() {
        arrow.translatesAutoresizingMaskIntoConstraints = false
        arrow.image = UIImage(systemName: "arrow.right")
        arrow.tintColor = UIColor(named: "redViewColor")
    }

    func configTransactionTypeName() {
        transactionType.translatesAutoresizingMaskIntoConstraints = false
        transactionType.text = ""
        transactionType.textColor = UIColor(named: "textgrey")?
            .withAlphaComponent(0.55)
        transactionType.font = .systemFont(ofSize: 13, weight: .bold)
    }

    func configTransactionAmount() {
        transactionAmount.translatesAutoresizingMaskIntoConstraints = false
        transactionAmount.text = ""
        transactionAmount.textColor = UIColor(named: "darkblue")
        transactionAmount.font = .systemFont(ofSize: 33.3, weight: .bold)
    }

    func configTransactionCurrencyName() {
        transactionCurrencyName.translatesAutoresizingMaskIntoConstraints =
            false
        transactionCurrencyName.text = ""
        transactionCurrencyName.textColor = UIColor(named: "textgrey")?
            .withAlphaComponent(0.50)
        transactionCurrencyName.font = .systemFont(ofSize: 18, weight: .bold)
    }

    func configTransactionDate() {
        transactionDate.translatesAutoresizingMaskIntoConstraints = false
        transactionDate.text = ""
        transactionDate.textColor = (UIColor(named: "textgrey") ?? .gray)
            .withAlphaComponent(0.50)
        transactionDate.font = .systemFont(ofSize: 13)
    }

    func configTransactionStatus() {
        transactionStatus.translatesAutoresizingMaskIntoConstraints = false

        transactionStatus.backgroundColor = UIColor(named: "greenColor")?
            .withAlphaComponent(0.1)
        transactionStatus.layer.cornerRadius = 16
        transactionStatus.textAlignment = .center
        transactionStatus.clipsToBounds = true
        transactionStatus.text = "Completed"
        transactionStatus.textColor = UIColor(named: "greenColor")
        transactionStatus.font = .systemFont(ofSize: 14, weight: .bold)
    }

    func configTableView() {
        transactionDetailsTabelView.translatesAutoresizingMaskIntoConstraints =
            false
        transactionDetailsTabelView.backgroundColor = .clear
        transactionDetailsTabelView.separatorStyle = .none
        transactionDetailsTabelView.isScrollEnabled = false
        transactionDetailsTabelView.rowHeight = 53

        transactionDetailsTabelView.dataSource = self

        transactionDetailsTabelView.register(
            TransactionDetailCell.self,
            forCellReuseIdentifier: TransactionDetailCell.identifier
        )
    }

    func configDescriptionCard() {
        descriptionCard.translatesAutoresizingMaskIntoConstraints = false
        descriptionCard.backgroundColor = .white
        descriptionCard.layer.cornerRadius = 20
        descriptionCard.clipsToBounds = true
    }

    func configDescriptionTitle() {
        descriptionTitle.translatesAutoresizingMaskIntoConstraints = false
        descriptionTitle.text = "Description"
        descriptionTitle.textColor = UIColor(named: "textgrey") ?? .gray
        descriptionTitle.font = .systemFont(ofSize: 13, weight: .bold)
    }

    func configDescriptionLabel() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = .systemFont(ofSize: 14.2)
        descriptionLabel.textColor = UIColor(named: "desColor")
        descriptionLabel.textAlignment = .left
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.text = ""
    }

    func configShareButton() {
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        shareButton.setTitle("Share Receipt", for: .normal)
        shareButton.setTitleColor(.white, for: .normal)
        shareButton.backgroundColor = UIColor(named: "buttonColor")
        shareButton.layer.cornerRadius = 18
        shareButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
    }

    func configTableViewBg() {

        tabelViewBg.translatesAutoresizingMaskIntoConstraints = false
        tabelViewBg.backgroundColor = .white
        tabelViewBg.layer.cornerRadius = 28
        tabelViewBg.clipsToBounds = true
    }

}

extension TransactionDetails: UITableViewDataSource {

    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return rows.count
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {

        let cell =
            tableView.dequeueReusableCell(
                withIdentifier: TransactionDetailCell.identifier,
                for: indexPath
            ) as! TransactionDetailCell

        let row = rows[indexPath.row]
        let isLastRow = indexPath.row == rows.count - 1

        cell.configure(
            title: row.title,
            value: row.value,
            hideSeparator: isLastRow
        )

        return cell
    }
}
