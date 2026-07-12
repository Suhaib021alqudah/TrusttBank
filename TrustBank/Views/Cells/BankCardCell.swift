//
//  BankCardCell.swift
//  LiquidBank
//
//  Created by Trainee on 05/07/2026.
//

import UIKit

class BankCardCell: UICollectionViewCell {

    static let identifier = "BankCardCell"

    let card = UIView()
    let cardType = UILabel()
    let cardNumber = UILabel()
    let cardOwner = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupUI()
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupUI() {

        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = UIColor(named: "visaCardBgColor")
        card.layer.cornerRadius = 22

        cardType.translatesAutoresizingMaskIntoConstraints = false
        cardType.text = "Debit Card"
        cardType.font = .systemFont(ofSize: 10)
        cardType.textColor = .white.withAlphaComponent(0.7)

        cardNumber.translatesAutoresizingMaskIntoConstraints = false
        cardNumber.text = "•••• 4821"
        cardNumber.font = .systemFont(ofSize: 14, weight: .bold)
        cardNumber.textColor = .white

        cardOwner.translatesAutoresizingMaskIntoConstraints = false
        cardOwner.text = "Ahmed Hassan"
        cardOwner.font = .systemFont(ofSize: 10)
        cardOwner.textColor = .white.withAlphaComponent(0.7)
    }

    func setupHierarchy() {
        contentView.addSubview(card)

        card.addSubview(cardType)
        card.addSubview(cardNumber)
        card.addSubview(cardOwner)
    }

    func setupLayout() {

        NSLayoutConstraint.activate([

            card.topAnchor.constraint(equalTo: contentView.topAnchor),
            card.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            card.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            card.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            cardType.topAnchor.constraint(
                equalTo: card.topAnchor,
                constant: 15
            ),
            cardType.leadingAnchor.constraint(
                equalTo: card.leadingAnchor,
                constant: 20
            ),

            cardNumber.topAnchor.constraint(
                equalTo: cardType.bottomAnchor,
                constant: 30
            ),
            cardNumber.leadingAnchor.constraint(
                equalTo: card.leadingAnchor,
                constant: 15
            ),

            cardOwner.topAnchor.constraint(
                equalTo: cardNumber.bottomAnchor,
                constant: 6
            ),
            cardOwner.leadingAnchor.constraint(
                equalTo: card.leadingAnchor,
                constant: 15
            ),
        ])

    }

    func configCard(
        cardColor: String,
        cardType: String,
        cardOwner: String,
        cardNumber: String
    ) {

        card.backgroundColor = UIColor(named: cardColor)
        layer.cornerRadius = 22

    }

}
