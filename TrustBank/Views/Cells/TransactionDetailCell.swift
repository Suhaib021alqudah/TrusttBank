//
//  TransactionDetailCell.swift
//  TrustBank
//
//  Created by Trainee on 07/07/2026.
//
import UIKit

class TransactionDetailCell: UITableViewCell {

    static let identifier = "TransactionDetailCell"

    let titleLabel = UILabel()
    let valueLabel = UILabel()
    let separatorView = UIView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupUI()
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupUI() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        selectionStyle = .none

        titleLabel.font = .systemFont(ofSize: 13, weight: .regular)
        titleLabel.textColor =
            UIColor(named: "textgrey")?
            .withAlphaComponent(0.65)
        titleLabel.textAlignment = .left

        valueLabel.font = .systemFont(ofSize: 14.9, weight: .bold)
        valueLabel.textColor = UIColor(named: "textgrey")
        valueLabel.textAlignment = .right
        valueLabel.numberOfLines = 1
        valueLabel.adjustsFontSizeToFitWidth = true
        valueLabel.minimumScaleFactor = 0.75

        titleLabel.setContentCompressionResistancePriority(
            .defaultLow,
            for: .horizontal
        )
        valueLabel.setContentCompressionResistancePriority(
            .required,
            for: .horizontal
        )

        separatorView.backgroundColor = UIColor.systemGray5
    }

    func setupHierarchy() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(valueLabel)
        contentView.addSubview(separatorView)
    }

    func setupLayout() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        separatorView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 45
            ),
            titleLabel.centerYAnchor.constraint(
                equalTo: contentView.centerYAnchor
            ),

            valueLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -45
            ),
            valueLabel.centerYAnchor.constraint(
                equalTo: contentView.centerYAnchor
            ),
            valueLabel.leadingAnchor.constraint(
                greaterThanOrEqualTo: titleLabel.trailingAnchor,
                constant: 16
            ),

            separatorView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 45
            ),
            separatorView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -45
            ),
            separatorView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor
            ),
            separatorView.heightAnchor.constraint(equalToConstant: 1),
        ])
    }

    func configure(title: String, value: String, hideSeparator: Bool) {
        titleLabel.text = title
        valueLabel.text = value
        separatorView.isHidden = hideSeparator
    }
}
